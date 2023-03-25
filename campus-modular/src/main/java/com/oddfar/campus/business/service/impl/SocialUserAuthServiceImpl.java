package com.oddfar.campus.business.service.impl;

import com.oddfar.campus.business.mapper.SocialUserAuthMapper;
import com.oddfar.campus.business.service.SocialUserAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SocialUserAuthServiceImpl implements SocialUserAuthService {
    @Autowired
    private SocialUserAuthMapper socialUserAuthMapper;

    @Override
    public Long getUserIdByWxamp(String openid) {
        return socialUserAuthMapper.getUserIdByWxamp(openid);
    }

    @Override
    public void insertUserSocial(Long socialUserId, Long userId, String source, String uuid) {
        socialUserAuthMapper.insertUserSocial(socialUserId, uuid, source);
        socialUserAuthMapper.insertUserSocialAuth(socialUserId, userId);
    }

    @Override
    public void insertUserSocialByOpenid(String openid, Long userId) {
        Long socialUserId = socialUserAuthMapper.getSocialUserId(openid);
        socialUserAuthMapper.insertUserSocialAuth(socialUserId, userId);
    }
}
