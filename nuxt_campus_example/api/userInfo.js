import request from '@/utils/request'

const api_name = `/api/user`

export default {
    //用户登录
    login(userInfo) {
        return request({
            url: "/login",
            method: `post`,
            data: userInfo
        })
    },
    //用户退出
    logout(){
        return request({
            url: `/logout`,
            method: `post`,
        })
    },
    //获取用户信息
    getUserInfo() {
        return request({
            url: `/getInfo`,
            method: `get`
        })
    },
    //用户注册
    register(loginVo) {
        return request({
            url: `/api/userInfo/register`,
            method: `post`,
            data: loginVo
        })
    },
    //修改密码
    ChangePassword(loginVo) {
        return request({
            url: `/api/userInfo/edit`,
            method: `post`,
            data: loginVo
        })
    },
    //修改昵称
    ChangeName(loginVo) {
        return request({
            url: `/api/userInfo/editName`,
            method: `post`,
            data: loginVo
        })
    },
   
}