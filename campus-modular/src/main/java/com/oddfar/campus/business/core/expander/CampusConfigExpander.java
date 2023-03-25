package com.oddfar.campus.business.core.expander;


import com.oddfar.campus.framework.api.sysconfig.ConfigContext;
import com.oddfar.campus.framework.api.sysconfig.ConfigExpander;

public class CampusConfigExpander {

    /**
     * 获取校园墙文件上传路径
     */
    public static String getCampusFilePath() {
        return ConfigExpander.getFileProfile() + "/CampusFile";
    }

    /**
     * 获取校园墙匿名头像
     */
    public static String getCampusAnonymousImage() {

        return ConfigContext.me().selectConfigByKey("campus.user.anonymous.image", String.class);

    }

    /**
     * 微信小程序appid
     */
    public static String getWxMpAppid(){
        return ConfigContext.me().selectConfigByKey("campus.wxmp.appid", String.class);
    }

    /**
     * 微信小程序secret
     */
    public static String getWxMpSecret(){
        return ConfigContext.me().selectConfigByKey("campus.wxmp.secret", String.class);
    }

}
