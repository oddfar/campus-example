import request from '@/utils/request'

// 登录方法
export function login(username, password, code, uuid) {
  const data = {
    username,
    password,
    code,
    uuid
  }
  return request({
    url: '/login',
    headers: {
      isToken: false
    },
    method: 'post',
    data: data
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

// 获取用户详细信息
export function getInfo() {
  return request({
    url: '/getInfo',
    method: 'get'
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