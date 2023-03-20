import request from '@/utils/request'

export default {
    //获取用户信息
    getUserInfo() {
        return request({
            url: `/getInfo`,
            method: `get`
        })
    },
    //判断有没有绑定邮箱
    haveMail() {
        return request({
            url: "/campus/haveMail",
            method: `get`
        })
    },


    // 查询用户个人信息
    getUserProfile() {
        return request({
            url: '/system/user/profile',
            method: 'get'
        })
    },

    // 用户密码重置
    updateUserPwd(oldPassword, newPassword) {
        const data = {
            oldPassword,
            newPassword
        }
        return request({
            url: '/system/user/profile/updatePwd',
            method: 'put',
            params: data
        })
    },

    // 用户头像上传
    uploadAvatar(data) {
        return request({
            url: '/system/user/profile/avatar',
            method: 'post',
            data: data
        })
    },


    // 修改用户个人信息
    updateUserProfile(data) {
        return request({
            url: '/system/user/profile',
            method: 'put',
            data: data
        })
    },


}