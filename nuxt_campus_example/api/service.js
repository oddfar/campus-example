import request from '@/utils/request'

const api_name = `/api/service/`

export default {
    //注册时发送邮件验证码
    sendMailCode(mail) {
        return request({
            url: `${api_name}sendMailCode/` + mail,
            method: `get`,
        })
    },
    //找回密码时发送邮件验证码
    sendRetrieveMaill(mail) {
        return request({
            url: `${api_name}sendRetrieveMail/` + mail,
            method: `get`,
        })
    },


}