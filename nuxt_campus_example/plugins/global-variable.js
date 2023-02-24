import Vue from 'vue'
//定义全局常量
var userGlobalConst = {
    userId: "",
    avatar: "",
    email: "",
    nickName: "",
    userName: ""
}

export {
    userGlobalConst
}

import globalVariable from '@/plugins/globalVariable.vue'
Vue.prototype.globalVariable = globalVariable;

Vue.prototype.userGlobalConst = userGlobalConst
