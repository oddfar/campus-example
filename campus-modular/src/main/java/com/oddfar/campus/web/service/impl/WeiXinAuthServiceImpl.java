package com.oddfar.campus.web.service.impl;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.oddfar.campus.business.api.weixin.WeiXinApi;
import com.oddfar.campus.business.service.SocialUserAuthService;
import com.oddfar.campus.common.core.RedisCache;
import com.oddfar.campus.common.domain.entity.SysUserEntity;
import com.oddfar.campus.common.domain.model.LoginUser;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.utils.ServletUtils;
import com.oddfar.campus.common.utils.StringUtils;
import com.oddfar.campus.common.utils.ip.IpUtils;
import com.oddfar.campus.framework.service.SysUserService;
import com.oddfar.campus.framework.web.service.SysPermissionService;
import com.oddfar.campus.framework.web.service.TokenService;
import com.oddfar.campus.web.service.WeiXinAuthService;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class WeiXinAuthServiceImpl implements WeiXinAuthService {

    @Autowired
    private RedisCache redisCache;
    @Autowired
    private SocialUserAuthService socialUserAuthService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private SysPermissionService permissionService;
    @Autowired
    private TokenService tokenService;


    @Override
    public String getAccessToken() {
        String cacheKey = getCacheKey() + "access_token";
        String accessToken = Convert.toStr(redisCache.getCacheObject(cacheKey));
        if (StringUtils.isEmpty(accessToken)) {
            JSONObject jsonObject = JSONObject.parseObject(WeiXinApi.getAccessToken());
            accessToken = jsonObject.getString("access_token");
            redisCache.setCacheObject(cacheKey, accessToken, 1, TimeUnit.HOURS);
        }

        return accessToken;

    }

    @Override
    public String getWxCodeUnLimit(String uuid) {
        redisCache.setCacheObject(getCacheKey() + uuid, "1", 4, TimeUnit.MINUTES);
        String buffer = WeiXinApi.getWxCodeUnLimit(getAccessToken(), uuid, "pages/auth/wxamp");
        return buffer;
    }

    @Override
    public boolean setWxampCode(String uuid, String code) {
        String c = Convert.toStr(redisCache.getCacheObject(getCacheKey() + uuid));
        if ("1".equals(c)) {
            redisCache.setCacheObject(getCacheKey() + uuid, code, 4, TimeUnit.MINUTES);
            return true;
        }
        return false;
    }

    @Override
    public String wxampLogin(String uuid) {
        String code = Convert.toStr(redisCache.getCacheObject(getCacheKey() + uuid));
        if (StringUtils.isEmpty(code)) {
            throw new ServiceException("uuid不正确");
        }

        JSONObject jsonObject = JSONObject.parseObject(WeiXinApi.wxampLogin(code));
        String openid = jsonObject.getString("openid");
        if (StringUtils.isEmpty(openid)) {
            throw new ServiceException("openid不存在");
        }
        //删除key
        redisCache.deleteObject(getCacheKey() + uuid);
        //没注册时，自动生成账号
        Long userId = socialUserAuthService.getUserIdByWxamp(openid);
        SysUserEntity userEntity = new SysUserEntity();
        if (userId == null) {
            //TODO 新用户小程序登录待更新
            //暂且先这样处理

            long id = IdWorker.getId();

            userEntity.setUserId(id);
            userEntity.setUserName(Convert.toStr(id));
            userEntity.setNickName(RandomStringUtils.randomAlphabetic(8));

            userService.insertUser(userEntity);
            socialUserAuthService.insertUserSocial(IdWorker.getId(), userEntity.getUserId(), "WXAMP", openid);

        }

        userEntity = userService.selectUserById(userId);
        //生成用户token
        LoginUser loginUser = new LoginUser(userEntity.getUserId(), userEntity,
                permissionService.getMenuPermission(userEntity), permissionService.getResources(userEntity));
        //记录登录信息
        recordLoginInfo(loginUser.getUserId());
        return tokenService.createToken(loginUser);

    }


    /**
     * 记录登录信息
     *
     * @param userId 用户ID
     */
    public void recordLoginInfo(Long userId) {
        SysUserEntity sysUser = new SysUserEntity();
        sysUser.setUserId(userId);
        sysUser.setLoginIp(IpUtils.getIpAddr(ServletUtils.getRequest()));
        sysUser.setLoginDate(DateUtil.date());
        userService.updateUserProfile(sysUser);
    }

    private static String getCacheKey() {
        return "wxamp:";
    }
}
