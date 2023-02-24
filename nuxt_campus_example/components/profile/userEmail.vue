<template>
  <div>
    <el-form ref="emailForm" :model="emailForm" :rules="emailRules">
      <h3>密码验证</h3>
      <el-form-item prop="password">
        <el-input
          v-model="emailForm.password"
          type="password"
          auto-complete="off"
          placeholder="密码"
        >
          <svg-icon
            slot="prefix"
            icon-class="password"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>
      <el-form-item prop="email">
        <el-input
          v-model="emailForm.email"
          type="text"
          auto-complete="off"
          placeholder="邮箱"
        >
          <svg-icon
            slot="prefix"
            icon-class="user"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>
      <el-form-item prop="code">
        <el-input
          v-model="emailForm.code"
          auto-complete="off"
          placeholder="验证码"
          style="width: 63%"
          @keyup.enter.native="handleEmail"
        >
          <svg-icon
            slot="prefix"
            icon-class="validCode"
            class="el-input__icon input-icon"
          />
        </el-input>
        <div class="email-code">
          <img :src="codeUrl" @click="getCode" class="email-code-img" />
        </div>
      </el-form-item>
      <el-form-item style="width: 100%">
        <el-button
          :loading="loading"
          size="medium"
          :type="isShow?'info':'primary'"
          :disabled="isShow"
          style="width: 100%"
          @click.native.prevent="handleEmail"
        >
          <span v-if="!loading">{{ isShow ? count : "开始绑定" }}</span>
          <span v-else>请 求 中...</span>
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getCodeImg, checkEmailUnique, bindMail } from "@/api/login";

export default {
  props: {
    user: {
      type: Object,
    },
  },
  data() {
    const checkEmail = (rule, value, callback) => {
      //判断用户名是否存在
      checkEmailUnique(value).then((response) => {
        if (response.data !== true) {
          callback(new Error("邮箱已经存在"));
          return;
        } else {
          callback();
        }
      });
    };
    return {
      emailRules: {
        email: [
          { required: true, message: "邮箱地址不能为空", trigger: "blur" },
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"],
          },
          { required: true, validator: checkEmail, trigger: "blur" },
        ],
        password: [{ required: true, message: "密码不能为", trigger: "blur" }],
        code: [{ required: true, message: "验证码不能为空", trigger: "blur" }],
      },
      emailForm: {
        password: "",
        email: "",
        code: "",
        uuid: "",
      },
      codeUrl: "",
      loading: false,
      //倒计时
      isShow: false,
      count: 0,
    };
  },
  created() {
    this.getCode();
  },
  watch: {
    user(news, olds) {
      this.emailForm.email = this.handleCampusUrl(news.avatar);
    },
  },
  methods: {
    getCode() {
      getCodeImg().then((res) => {
        this.captchaEnabled =
          res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.emailForm.uuid = res.uuid;
        }
      });
    },
    handleEmail() {
      this.$refs.emailForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          bindMail(this.emailForm)
            .then((response) => {
              this.$message({
                message: response.msg,
                type: "success",
              });
              this.loading = false;
              this.getCode();
              this.verification();
            })
            .catch(() => {
              this.loading = false;
              this.getCode();
            });
        }
      });
    },
    //倒计时
    verification() {
      this.isShow = true; //倒计时
      this.count = 60; //赋值多少秒
      var times = setInterval(() => {
        this.count--; //递减
        if (this.count <= 0) {
          // <=0 变成获取按钮
          this.isShow = false;
          clearInterval(times);
        }
      }, 1000); //1000毫秒后执行
    },
  },
};
</script>
<style>
.email-code {
  width: 33%;
  height: 38px;
  float: right;
}
.email-code img {
  cursor: pointer;
  vertical-align: middle;
  height: 38px;
}
</style>