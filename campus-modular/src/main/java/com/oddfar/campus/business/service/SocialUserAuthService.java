package com.oddfar.campus.business.service;

public interface SocialUserAuthService {
    /**
     * 根据微信小程序的openid获取用户id
     *
     * @param openid
     * @return
     */
    Long getUserIdByWxamp(String openid);

    /**
     * 添加第三方登录的信息
     */
    void insertUserSocial(Long socialUserId, Long userId, String source, String uuid);

    /**
     * 根据Openid添加第三方登录的信息
     *
     * @param openid
     * @param userId
     */
    void insertUserSocialByOpenid(String openid, Long userId);
}
