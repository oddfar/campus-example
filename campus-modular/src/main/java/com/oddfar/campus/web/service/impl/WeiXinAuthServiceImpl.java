package com.oddfar.campus.web.service.impl;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.oddfar.campus.business.api.weixin.WeiXinApi;
import com.oddfar.campus.business.domain.auth.WxMPLoginBody;
import com.oddfar.campus.business.service.SocialUserAuthService;
import com.oddfar.campus.common.constant.UserConstants;
import com.oddfar.campus.common.core.RedisCache;
import com.oddfar.campus.common.domain.entity.SysUserEntity;
import com.oddfar.campus.common.domain.model.LoginUser;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.utils.SecurityUtils;
import com.oddfar.campus.common.utils.ServletUtils;
import com.oddfar.campus.common.utils.StringUtils;
import com.oddfar.campus.common.utils.ip.IpUtils;
import com.oddfar.campus.framework.service.SysUserService;
import com.oddfar.campus.framework.web.service.SysPermissionService;
import com.oddfar.campus.framework.web.service.TokenService;
import com.oddfar.campus.web.service.WeiXinAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;
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
            throw new ServiceException("openid异常");
        }
        //删除key
        redisCache.deleteObject(getCacheKey() + uuid);
        //没注册时，自动生成账号
        Long userId = socialUserAuthService.getUserIdByWxamp(openid);
        SysUserEntity userEntity = new SysUserEntity();
        if (userId == null) {
            throw new ServiceException("请使用小程序绑定账号再登录");
            //暂且先这样处理

//            long id = IdWorker.getId();
//
//            userEntity.setUserId(id);
//            userEntity.setUserName(Convert.toStr(id));
//            userEntity.setNickName(RandomStringUtils.randomAlphabetic(8));
//
//            userService.insertUser(userEntity);
//            socialUserAuthService.insertUserSocial(IdWorker.getId(), userEntity.getUserId(), "WXAMP", openid);

        }

        userEntity = userService.selectUserById(userId);
        //生成用户token
        LoginUser loginUser = new LoginUser(userEntity.getUserId(), userEntity,
                permissionService.getMenuPermission(userEntity), permissionService.getResources(userEntity));
        //记录登录信息
        recordLoginInfo(loginUser.getUserId());
        return tokenService.createToken(loginUser);

    }

    @Override
    public String loginByAmpCode(String code) {
        String openid = getOpenidByCode(code);

        Long userId = socialUserAuthService.getUserIdByWxamp(openid);
        SysUserEntity userEntity = new SysUserEntity();
        if (userId == null) {
            return null;
        } else {
            userEntity = userService.selectUserById(userId);

        }

        //生成用户token
        LoginUser loginUser = new LoginUser(userEntity.getUserId(), userEntity,
                permissionService.getMenuPermission(userEntity), permissionService.getResources(userEntity));
        //记录登录信息
        recordLoginInfo(loginUser.getUserId());
        return tokenService.createToken(loginUser);
    }

    @Override
    public boolean checkWxampBindAccount(String openid) {

        Long userId = socialUserAuthService.getUserIdByWxamp(openid);
        return userId != null;
    }

    @Override
    public String wxampBind(WxMPLoginBody loginBody) {
        String openid = getOpenidByCode(loginBody.getCode());

        SysUserEntity user = userService.selectUserByUserName(loginBody.getUsername());
        if (user == null) {
            throw new ServiceException("用户不存在");
        }
        if (checkWxampBindAccount(openid)) {
            throw new ServiceException("此账号已被绑定");
        }
        String password = user.getPassword();
        if (!SecurityUtils.matchesPassword(loginBody.getPassword(), password)) {
            throw new ServiceException("密码错误");
        }

        //添加第三方登录的信息
        socialUserAuthService.insertUserSocial(IdWorker.getId(), user.getUserId(), "WXAMP", openid);

        return getLoginToken(user);
    }

    @Override
    public String wxampRegister(WxMPLoginBody loginBody) {
        String openid = getOpenidByCode(loginBody.getCode());
        if (checkWxampBindAccount(openid)) {
            throw new ServiceException("此账号已被绑定");
        }
        String msg = "", username = loginBody.getUsername(), password = loginBody.getPassword();
        SysUserEntity sysUser = new SysUserEntity();
        sysUser.setUserName(username);

        if (StringUtils.isEmpty(username)) {
            msg = "用户名不能为空";
            throw new ServiceException(msg);
        } else if (StringUtils.isEmpty(password)) {
            msg = "用户密码不能为空";
            throw new ServiceException(msg);
        } else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            msg = "账户长度必须在2到20个字符之间";
            throw new ServiceException(msg);
        } else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            msg = "密码长度必须在5到20个字符之间";
            throw new ServiceException(msg);
        } else if (!userService.checkUserNameUnique(sysUser)) {
            msg = "保存用户'" + username + "'失败，注册账号已存在";
            throw new ServiceException(msg);
        } else {
            sysUser.setNickName(username);
            sysUser.setPassword(SecurityUtils.encryptPassword(password));
            sysUser.setStatus("0");
            sysUser.setUserId(IdWorker.getId());
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag) {
                msg = "注册失败,请联系系统管理人员";
                throw new ServiceException(msg);
            } else {
                //注册成功
                socialUserAuthService.insertUserSocial(IdWorker.getId(), sysUser.getUserId(), "WXAMP", openid);
                setRole(sysUser.getUserId());
                SysUserEntity userEntity = userService.selectUserById(sysUser.getUserId());
                return getLoginToken(userEntity);
            }
        }

    }

    public void setRole(Long userId) {
        //验证成功后给用户添加角色
        Set<String> roleSet = new HashSet<>();
        roleSet.add("campus:common");
        userService.insertUserAuth(userId, roleSet);
    }


    public String getOpenidByCode(String code) {
        JSONObject jsonObject = JSONObject.parseObject(WeiXinApi.wxampLogin(code));
        String openid = jsonObject.getString("openid");
        if (StringUtils.isEmpty(openid)) {
            throw new ServiceException("openid异常");
        }
        return openid;
    }

    public String getLoginToken(SysUserEntity userEntity) {
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

    private static String getMpBindKey() {
        return "wxamp_bind:";
    }
}
