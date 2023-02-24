<template>
  <div class="profile-container">
    <client-only
      ><el-card style="width: 600px">
        <div slot="header" class="clearfix">
          <span>基本资料</span>
        </div>
        <div class="box-card">
          <div class="text-center">
            <userAvatar :user="user" />
          </div>
        </div>
        <el-tabs v-model="activeTab">
          <el-tab-pane label="基本资料" name="userinfo">
            <userInfo :user="user" />
          </el-tab-pane>
          <el-tab-pane label="修改密码" name="resetPwd">
            <resetPwd />
          </el-tab-pane>
        </el-tabs> </el-card
    ></client-only>
  </div>
</template>

<script>
import userAvatar from "@/components/profile/userAvatar";
import userInfo from "@/components/profile/userInfo";
import resetPwd from "@/components/profile/resetPwd";
import { getUserProfile } from "@/api/user";

export default {
  name: "Profile",
  components: { userAvatar, userInfo, resetPwd },
  data() {
    return {
      user: {},
      activeTab: "userinfo",
    };
  },
  created() {
    this.getUser();
  },
  methods: {
    getUser() {
      getUserProfile().then((response) => {
        this.user = response.data;
      });
    },
  },
};
</script>
<style scoped>
.profile-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}
.text-center {
  text-align: center;
}
</style>
