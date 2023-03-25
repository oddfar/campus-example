package com.oddfar.campus.web.service;

import com.oddfar.campus.business.domain.auth.WxMPLoginBody;

public interface WeiXinAuthService {
    /**
     * 获取接口调用凭据
     *
     * @return access_token
     */
    String getAccessToken();

    /**
     * 获取不限制的小程序码
     *
     * @return 图片 Buffer
     */
    String getWxCodeUnLimit(String uuid);

    /**
     * 设置uuid中的code
     *
     * @param uuid
     * @param code
     * @return
     */
    boolean setWxampCode(String uuid, String code);

    /**
     * 小程序扫码登录，根据微信小程序登录用户
     *
     * @param uuid uuid
     * @return
     */
    String wxampLogin(String uuid);

    /**
     * 根据微信小程序code登录用户
     *
     * @param code code
     * @return token
     */
    String loginByAmpCode(String code);

    /**
     * 小程序是否绑定了账号
     *
     * @return true为绑定
     */
    boolean checkWxampBindAccount(String openid);

    /**
     * 小程序登录绑定账号
     *
     * @param loginBody
     * @return 登录后的token
     */
    String wxampBind(WxMPLoginBody loginBody);

    /**
     * 小程序注册账号
     *
     * @param loginBody
     * @return 登录后的token
     */
    String wxampRegister(WxMPLoginBody loginBody);
}
