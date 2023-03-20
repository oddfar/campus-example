package com.oddfar.campus.web.service;

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
     * 根据微信小程序登录用户，未有用户则注册
     *
     * @return
     */
    String wxampLogin(String uuid);
}
