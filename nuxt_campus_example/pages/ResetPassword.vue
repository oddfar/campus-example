<template>
  <div class="ss">
    <el-row>
      <el-col :sm="{ span: 8, offset: 8 }" :xs="{ span: 24, offset: 0 }">
        <div class="grid-content bg-purple-dark">
          <div>
            <div class="zt">
              <span class="title" style="font-weight: bold">重置密码</span>
            </div>
            <!--修改密码 #start -->
            <el-form
              :model="ruleForm"
              status-icon
              :rules="rules"
              ref="ruleForm"
              label-width="100px"
              class="demo-ruleForm"
            >
              <!-- 邮箱获取验证部分 -->
              <div v-show="true">
                <el-form-item label="邮箱：" prop="email">
                  <el-input
                    placeholder="请输入注册时的Email"
                    class="ss1"
                    type="text"
                    v-model="ruleForm.email"
                    autocomplete="off"
                  ></el-input>
                </el-form-item>
                <el-form-item style="margin-right: -50px">
                  <el-button
                    type="primary"
                    @click="GetCode"
                    style="margin-right: 10px"
                    >获取验证码</el-button
                  >
                </el-form-item>
              </div>
              <!-- 邮箱验证码验证部分 -->
              <div v-show="true">
                <el-form-item label="验证码：" prop="code">
                  <el-input
                    placeholder="请输入验证码"
                    class="ss1"
                    type="text"
                    v-model="ruleForm.code"
                    autocomplete="off"
                  ></el-input>
                </el-form-item>
              </div>
              <!-- 密码部分 -->
              <div v-show="true">
                <el-form-item label="密码：" prop="password">
                  <el-input
                    placeholder="密码"
                    class="ss1"
                    type="password"
                    v-model="ruleForm.password"
                    autocomplete="off"
                  ></el-input>
                </el-form-item>

                <el-form-item label="确认密码：" prop="checkPass">
                  <el-input
                    placeholder="确认密码"
                    class="ss1"
                    type="password"
                    show-password
                    v-model="ruleForm.checkPass"
                    autocomplete="off"
                  ></el-input>
                </el-form-item>
                <!-- 提交框 -->
                <el-form-item style="margin-right: -50px">
                  <el-button
                    type="primary"
                    @click="submitForm('ruleForm')"
                    style="margin-right: 10px"
                    >提交</el-button
                  >
                </el-form-item>
              </div>
            </el-form>
          </div>
        </div></el-col
      >
    </el-row>

    <!--修改密码 #end -->
  </div>
</template>
<script>
import apiService from "@/api/service";
import apiUserInfo from "@/api/userInfo";
export default {
  data() {
    var validatepassword = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.ruleForm.checkPass !== "") {
          this.$refs.ruleForm.validateField("checkPass");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.ruleForm.password) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    var validateEmail = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入邮箱号"));
      } else {
        callback();
      }
    };
    var validatecode = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入验证码"));
      } else {
        callback();
      }
    };
    var validateName = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入用户名"));
      } else {
        callback();
      }
    };
    return {
      loginVo: {},
      ruleForm: {
        password: "",
        checkPass: "",
        code: "",
        name: "",
        email: "",
      },
      rules: {
        password: [{ validator: validatepassword, trigger: "blur" }],
        checkPass: [{ validator: validatePass2, trigger: "blur" }],
        email: [{ validator: validateEmail, trigger: "blur" }],
        code: [{ validator: validatecode, trigger: "blur" }],
        name: [{ validator: validateName, trigger: "blur" }],
      },
    };
  },
  methods: {
    //发送验证码
    GetCode() {
      apiService
        .sendRetrieveMaill(this.ruleForm.email)
        .then((response) => {
          this.$message.success("发送成功");
        })
        .catch((response) => {
          //发送邮箱验证码失败时：
          this.$message.error("请输入正确的邮箱账号!");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.loginVo.account = this.ruleForm.email;
          this.loginVo.code = this.ruleForm.code;
          this.loginVo.password = this.ruleForm.password;
          // console.log(this.loginVo);
          apiUserInfo
            .ChangePassword(this.loginVo)
            .then((response) => {
              this.$router.push({ path: "/userlogin", query: { id: "2" } });
            })
            .catch((response) => {
              this.$message.error("修改失败!");
              return false;
            });
        } else {
          // console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
};
</script>
<style>
.zt {
  width: 100%;
  text-align: center;
  padding: 20px;
}
.ss {
  margin: 0 auto;
  height: 100%;
}
#aaaa {
  margin: 0 auto;
}
.router-link-active {
  text-decoration: none;
}
</style>