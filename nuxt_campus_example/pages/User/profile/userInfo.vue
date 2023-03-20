<template>
  <div>
    <el-form ref="form" :model="user" :rules="rules" label-width="80px">
      <el-form-item label="用户昵称" prop="nickName">
        <el-input v-model="user.nickName" maxlength="30" />
      </el-form-item>
      <!-- <el-form-item label="手机号码" prop="phonenumber">
      <el-input v-model="user.phonenumber" maxlength="11" />
    </el-form-item> -->
      <el-form-item label="邮箱" prop="email">
        <div style="display: flex">
          <el-input v-model="user.email" :disabled="true" maxlength="50" />
          <el-button type="info" @click="openDialog()">更换邮箱</el-button>
        </div>
      </el-form-item>
      <el-form-item label="性别">
        <el-radio-group v-model="user.sex">
          <el-radio label="0">男</el-radio>
          <el-radio label="1">女</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" size="mini" @click="submit">保存</el-button>
        <el-button type="danger" size="mini" @click="close">关闭</el-button>
      </el-form-item>
    </el-form>

    <el-dialog title="更换邮箱" :visible.sync="dialogVisible" width="600px">
      <userEmail v-if="user !== undefined" :user="user" />
    </el-dialog>
  </div>
</template>

<script>
import userInfoApi from "@/api/userInfo";
import { getCodeImg, checkEmailUnique } from "@/api/login";

import userEmail from "./userEmail";

export default {
  components: { userEmail },
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
      // 表单校验
      rules: {
        nickName: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" },
        ],
        // phonenumber: [
        //   { required: true, message: "手机号码不能为空", trigger: "blur" },
        //   {
        //     pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
        //     message: "请输入正确的手机号码",
        //     trigger: "blur",
        //   },
        // ],
      },
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
      },
      dialogVisible: false,
      emailForm: {
        email: "",
        code: "",
        uuid: "",
      },
      codeUrl: "",
      loading: false,
    };
  },
  created() {},
  methods: {
    submit() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          userInfoApi.updateUserProfile(this.user).then((response) => {
            this.$modal.msgSuccess("修改成功");
          });
        }
      });
    },
    close() {
      this.$tab.closePage();
    },
    openDialog() {
      this.dialogVisible = true;
    },
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
    handleEmail() {},
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