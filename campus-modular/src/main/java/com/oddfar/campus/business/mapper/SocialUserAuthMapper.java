package com.oddfar.campus.business.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SocialUserAuthMapper {
    /**
     * 根据微信小程序的openid获取用户id
     *
     * @param openid
     * @return
     */
    Long getUserIdByWxamp(String openid);

    /**
     * 根据uuid获取社会话用户表id
     * @param uuid
     * @return
     */
    Long getSocialUserId(String uuid);

    /**
     * 添加第三方登录的信息
     */
    void insertUserSocial(@Param("socialUserId") Long socialUserId, @Param("uuid") String uuid,
                          @Param("source") String source);

    /**
     * 添加第三方登录和用户的关系
     */
    void insertUserSocialAuth(@Param("socialUserId") Long socialUserId, @Param("userId") Long userId );
}
