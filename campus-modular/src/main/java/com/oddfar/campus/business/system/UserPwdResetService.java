package com.oddfar.campus.business.system;

public interface UserPwdResetService {

    /**
     * 给绑定邮件发送修改密码的验证码
     *
     * @param email 邮箱
     * @param code 图形验证码
     * @param uuid uuid
     */
    void sendResetPwdCode(String email,String code, String uuid);

    /**
     * 重置密码
     * @param email
     * @param code
     * @param password
     */
    void resetPwd(String email, String code, String password);
}
