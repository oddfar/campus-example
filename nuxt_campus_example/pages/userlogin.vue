<template>
  <div class="ss">
    <div class="grid-content bg-purple-dark">
      <div class="login">
        <!--账号登录 #start -->

        <el-form
          ref="loginForm"
          :model="loginForm"
          :rules="loginRules"
          class="login-form"
        >
          <h3 class="title">登录账户</h3>
          <el-form-item prop="username">
            <el-input
              v-model="loginForm.username"
              type="text"
              auto-complete="off"
              placeholder="账号"
            >
              <svg-icon
                slot="prefix"
                icon-class="user"
                class="el-input__icon input-icon"
              />
            </el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input
              v-model="loginForm.password"
              type="password"
              auto-complete="off"
              placeholder="密码"
              @keyup.enter.native="handleLogin"
            >
              <svg-icon
                slot="prefix"
                icon-class="password"
                class="el-input__icon input-icon"
              />
            </el-input>
          </el-form-item>
          <el-form-item prop="code" v-if="captchaEnabled">
            <el-input
              v-model="loginForm.code"
              auto-complete="off"
              placeholder="验证码"
              style="width: 63%"
              @keyup.enter.native="handleLogin"
            >
              <svg-icon
                slot="prefix"
                icon-class="validCode"
                class="el-input__icon input-icon"
              />
            </el-input>
            <div class="login-code">
              <img :src="codeUrl" @click="getCode" class="login-code-img" />
            </div>
          </el-form-item>
          <el-form-item>
            <router-link
              :to="{ path: 'Resetpassword' }"
              style="float: left"
              class="router-link-active"
            >
              <el-link type="danger">忘记密码？</el-link>
            </router-link>

            <span
              style="float: right"
              class="router-link-active"
              @click="openWxamp"
            >
              <el-link type="danger">使用微信登录</el-link>
            </span>
          </el-form-item>

          <el-form-item style="width: 100%">
            <el-button
              :loading="loading"
              size="medium"
              type="primary"
              style="width: 100%"
              @click.native.prevent="handleLogin"
            >
              <span v-if="!loading">登 录</span>
              <span v-else>登 录 中...</span>
            </el-button>
            <div style="float: right">
              <router-link class="link-type" :to="'/register'"
                >立即注册</router-link
              >
            </div>
          </el-form-item>
        </el-form>
      </div>
    </div>

    <!--登录 #end -->
  </div>
</template>
<script>
import cookie from "js-cookie";
import userInfoApi from "@/api/userInfo.js";
import { getCodeImg, login } from "@/api/login";
import { getToken, setToken, removeToken } from "@/utils/auth";

export default {
  data() {
    return {
      loginForm: {
        username: "",
        password: "",
        code: "",
        uuid: "",
      },
      codeUrl: "",
      loginRules: {
        username: [
          { required: true, trigger: "blur", message: "请输入您的账号" },
        ],
        password: [
          { required: true, trigger: "blur", message: "请输入您的密码" },
        ],
        code: [{ required: true, trigger: "change", message: "请输入验证码" }],
      },
      loading: false,
      // 验证码开关
      captchaEnabled: true,
    };
  },
  created() {
    if (getToken() !== undefined) {
      this.$router.push("/");
    } else if (this.$route.query.id != "") {
      if (this.$route.query.id == 1) {
        this.$message.error("请先登录！");
      } else if (this.$route.query.id == 2) {
        this.$message.success("修改成功!请登录!");
      }
      this.$router.push("/userlogin");
    }
    this.getCode();
  },
  methods: {
    //获取验证码
    getCode() {
      getCodeImg().then((res) => {
        this.captchaEnabled =
          res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.loginForm.uuid = res.uuid;
        }
      });
    },
    //打开微信小程序二维码登录
    openWxamp() {
      
      var flag = window.open("/wxamp", "Campus", "width=400,height=700,left=30,top=10");
      var loop = setInterval(function () {
        if (flag.closed) {
          clearInterval(loop);
          window.location.reload();
        }
      }, 3);
    },
    // 用户登录
    handleLogin() {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          //登录接口
          login(this.loginForm)
            .then((response) => {
              // 登录成功 设置cookie
              this.setCookies(response);

              //重新加载
              window.location.reload();
            })
            .catch((response) => {
              this.loading = false;
              if (this.captchaEnabled) {
                this.getCode();
              }
            });
        }
      });
    },
    //设置COOKIE
    setCookies(res) {
      setToken(res.token);
    },
  },
};
</script>

<style>
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}
.router-link-active {
  text-decoration: none;
}

.login-form {
  border-radius: 6px;
  background: #ffffff;
  width: 400px;
  padding: 25px 25px 5px 25px;
}
.el-input {
  height: 38px;
}
.el-input input {
  height: 38px;
}
.input-icon {
  height: 39px;
  width: 14px;
  margin-left: 2px;
}

.login-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}
.login-code {
  width: 33%;
  height: 38px;
  float: right;
}
.login-code img {
  cursor: pointer;
  vertical-align: middle;
}
.el-login-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}
.login-code-img {
  height: 38px;
}
</style>