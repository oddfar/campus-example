package com.oddfar.campus.business.api.weixin;

import cn.hutool.http.HttpResponse;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.oddfar.campus.business.core.expander.CampusConfigExpander;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

public class WeiXinApi {

    public static String APPID = CampusConfigExpander.getWxMpAppid();
    public static String SECRET = CampusConfigExpander.getWxMpSecret();

    public static String getAccessToken() {
        String url = "https://api.weixin.qq.com/cgi-bin/token";
        Map<String, Object> map = new HashMap<>();
        map.put("grant_type", "client_credential");
        map.put("appid", APPID);
        map.put("secret", SECRET);
        return HttpUtil.get(url, map);
    }

    /**
     * 获取小程序码 base64编码
     *
     * @param access_token
     * @param scene
     * @param page
     * @return
     */
    public static String getWxCodeUnLimit(String access_token, String scene, String page) {

        String url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" + access_token;
        Map<String, Object> map = new HashMap<>();
        map.put("scene", scene);
        map.put("width", 280);
        map.put("page", page);
        HttpResponse execute = HttpUtil.createPost(url).body(JSON.toJSONString(map)).execute();
        if (execute.getStatus() == 200) {
            byte[] buffer = execute.bodyBytes();
            return Base64.getEncoder().encodeToString(buffer);
        } else {
            return execute.body();
        }

    }

    /**
     * 小程序登录
     *
     * @return
     */
    public static String wxampLogin(String code) {

        String url = "https://api.weixin.qq.com/sns/jscode2session";
        Map<String, Object> map = new HashMap<>();
        map.put("appid", APPID);
        map.put("secret", SECRET);
        map.put("js_code", code);
        map.put("grant_type", "authorization_code");

        return HttpUtil.post(url, map);

    }


}
