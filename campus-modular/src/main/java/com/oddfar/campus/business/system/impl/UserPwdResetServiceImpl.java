package com.oddfar.campus.business.system.impl;

import cn.hutool.core.collection.CollUtil;
import com.oddfar.campus.business.core.constant.CampusConstant;
import com.oddfar.campus.business.enums.CampusBizCodeEnum;
import com.oddfar.campus.business.system.UserPwdResetService;
import com.oddfar.campus.common.constant.CacheConstants;
import com.oddfar.campus.common.core.RedisCache;
import com.oddfar.campus.common.domain.entity.SysUserEntity;
import com.oddfar.campus.common.exception.ServiceException;
import com.oddfar.campus.common.exception.user.CaptchaException;
import com.oddfar.campus.common.exception.user.CaptchaExpireException;
import com.oddfar.campus.common.utils.SecurityUtils;
import com.oddfar.campus.common.utils.StringUtils;
import com.oddfar.campus.framework.api.mail.MailSendContext;
import com.oddfar.campus.framework.api.sysconfig.ConfigContext;
import com.oddfar.campus.framework.mapper.SysUserMapper;
import com.oddfar.campus.framework.service.SysUserService;
import com.oddfar.campus.framework.web.service.TokenService;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.common.TemplateParserContext;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Service
public class UserPwdResetServiceImpl implements UserPwdResetService {

    @Autowired
    private TokenService tokenService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private SysUserMapper userMapper;


    @Override
    public void sendResetPwdCode(String email, String code, String uuid) {
        //效验code
        validateCaptcha(code, uuid);

        String template = ConfigContext.me().selectConfigByKey("campus.mail.sendPwdTemplate", String.class
                , "您的验证码为：#{[random]}，有效期为10分钟");

        Map<String, Object> params = new HashMap<>();
        String random = RandomStringUtils.randomNumeric(6);
        params.put("random", random);
        //修改模板内容
        ExpressionParser parser = new SpelExpressionParser();
        TemplateParserContext parserContext = new TemplateParserContext();
        String content = parser.parseExpression(template, parserContext).getValue(params, String.class);
        // 发送邮件
        MailSendContext.me().sendQQMail(CollUtil.newArrayList(email),
                "重置密码验证码", content, true);
//        System.out.println(content);
        //存入redis
        redisCache.setCacheObject(getCheckKey(email), random,
                CampusConstant.RESET_PWD_EXPIRATION, TimeUnit.MINUTES);
    }

    @Override
    public void resetPwd(String email, String code, String password) {

        String redisCode = redisCache.getCacheObject(getCheckKey(email));
        if (StringUtils.isEmpty(redisCode) || !redisCode.equals(code)) {
            throw new ServiceException(CampusBizCodeEnum.CODE_ERROR.getMsg(),
                    CampusBizCodeEnum.CODE_ERROR.getCode());
        }

        SysUserEntity user = userMapper.selectOne("email", email);

        if (userService.resetUserPwd(user.getUserName(), SecurityUtils.encryptPassword(password)) > 0) {
            //删除code
            redisCache.deleteObject(getCheckKey(email));
            //TODO 下线：踢出此用户登录的所有会话

        }

    }

    /**
     * 校验验证码
     * 踢   *
     *
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String code, String uuid) {
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null) {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha)) {
            throw new CaptchaException();
        }
    }


    private String getCheckKey(String key) {
        return CampusConstant.RESET_PWD_KEY + key;
    }

}
