package com.oddfar.campus.business.controller.web;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.IdUtil;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.constant.Constants;
import com.oddfar.campus.common.core.RedisCache;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.web.service.WeiXinAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class UserAuthLoginController {
    @Autowired
    private WeiXinAuthService weiXinAuthService;
    @Autowired
    private RedisCache redisCache;

    /**
     * 第一步：获取小程序登录的二维码
     *
     * @return
     */
    @GetMapping("/wxampImg")
    @Anonymous
    public R wxampImg() {
        String uuid = IdUtil.simpleUUID();
        String img = weiXinAuthService.getWxCodeUnLimit(uuid);
        R r = new R();
        r.put("img", img);
        r.put("uuid", uuid);

        return r;
    }

    /**
     * 第二步：小程序接口，设置uuid中的code
     *
     * @param uuid uuid
     * @param code 微信登录接口获取的code
     * @return
     */
    @GetMapping("/wxampCode")
    @Anonymous
    public R setWxampCode(String uuid, String code) {
        boolean b = weiXinAuthService.setWxampCode(uuid, code);
        if (b) {
            return R.ok();
        } else {
            return R.error("数据异常，请重新登录");
        }
    }

    /**
     * 第三步：检测是否授权登录
     *
     * @param uuid
     * @return 1授权，0未授权
     */
    @GetMapping("/checkWxamp")
    @Anonymous
    public R checkWxamp(String uuid) {
        if (redisCache.hasKey("wxamp:" + uuid)) {
            String code = Convert.toStr(redisCache.getCacheObject("wxamp:" + uuid));
            if (!"1".equals(code)) {
                return R.ok("1");
            } else {
                return R.ok("0");
            }

        } else {
            return R.ok("0");
        }
    }

    /**
     * 根据小程序登录
     *
     * @param uuid uuid
     * @return
     */
    @GetMapping("/wxampLogin")
    @Anonymous
    public R wxampLogin(String uuid) {
        R r = new R();
        String token = weiXinAuthService.wxampLogin(uuid);

        r.put(Constants.TOKEN, token);

        return r;
    }

}
