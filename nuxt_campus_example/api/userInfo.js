import request from '@/utils/request'

export default {
    //用户登录
    // login(userInfo) {
    //     return request({
    //         url: "/login",
    //         method: `post`,
    //         data: userInfo
    //     })
    // },
    //用户退出
    // logout(){
    //     return request({
    //         url: `/logout`,
    //         method: `post`,
    //     })
    // },
    //获取用户信息
    getUserInfo() {
        return request({
            url: `/getInfo`,
            method: `get`
        })
    },
    /**
     * 判断有没有绑定邮箱
     */
    haveMail() {
        return request({
            url: "/campus/haveMail",
            method: `get`
        })
    },
  
   
}