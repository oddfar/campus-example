package com.oddfar.campus.business.domain.auth;

import lombok.Data;

/**
 * 微信小程序LoginBody
 */
@Data
public class WxMPLoginBody {
    /**
     * 用户名
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 微信小程序登录返回的code
     */
    private String code;

}
