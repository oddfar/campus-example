import request from '@/utils/request'

// 登录方法
export function login(userInfo) {
  return request({
    url: '/login',
    headers: {
      isToken: false
    },
    method: 'post',
    data: userInfo
  })
}

// 注册方法
export function register(data) {
  return request({
    url: '/register',
    headers: {
      isToken: false
    },
    method: 'post',
    data: data
  })
}

//绑定邮箱验证
export function bindMail(data) {
  return request({
    url: '/campus/bindMail',
    method: 'post',
    data: data
  })
}

//绑定邮箱验证
export function emailValidate(uuid) {
  return request({
    url: '/campus/email-validate',
    method: 'get',
    params: { uuid }
  })
}


//校验用户名称是否唯一
export function checkUserNameUnique(userName) {
  return request({
    url: '/userNameUnique',
    method: 'get',
    params: { userName }
  })
}

//校验用户名称是否唯一
export function checkEmailUnique(email) {
  return request({
    url: '/emailUnique',
    method: 'get',
    params: { email }
  })
}

// 退出方法
export function logout() {
  return request({
    url: '/logout',
    method: 'post'
  })
}

// 获取验证码
export function getCodeImg() {
  return request({
    url: '/captchaImage',
    headers: {
      isToken: false
    },
    method: 'get',
    timeout: 20000
  })
}

//第一步 获取微信小程序二维码
export function getWxampImg() {
  return request({
    url: '/wxampImg',
    headers: {
      isToken: false
    },
    method: 'get',
    timeout: 20000
  })
}

/**
 * 第三步：检测是否授权登录
 * @returns  1授权，0未授权
 */
export function checkWxamp(uuid) {
  return request({
    url: '/checkWxamp',
    headers: {
      isToken: false
    },
    method: 'get',
    params: { uuid }
  })
}
//根据小程序登录
export function wxampLogin(uuid) {
  return request({
    url: '/wxampLogin',
    headers: {
      isToken: false
    },
    method: 'get',
    params: { uuid }
  })
}

