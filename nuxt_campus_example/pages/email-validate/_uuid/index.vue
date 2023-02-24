<template>
  <div class="main-full-middle" v-loading="loading">
    <div style="width: 642px">
      <div v-if="!loading">
        <el-result
          icon="success"
          v-if="success"
          title="绑定成功"
          subTitle="将在3秒后跳转到首页"
        >
          <template slot="extra">
            <el-button type="primary" size="medium" @click="goHome()"
              >首页</el-button
            >
          </template>
        </el-result>

        <el-result
          icon="error"
          v-else
          title="绑定失败"
          subTitle="请重新绑定，将在3秒后跳转到首页"
        >
          <template slot="extra">
            <el-button type="primary" size="medium">返回</el-button>
          </template>
        </el-result>
      </div>
    </div>
  </div>
</template>

<script>
//api
import { emailValidate } from "@/api/login";

export default {
  data() {
    return {
      uuid: "",
      loading: true,
      success: "",
    };
  },

  //创建的时候自动调用
  created() {
    this.uuid = this.$route.params.uuid;
    this.email(this.uuid);
  },
  //创建后
  mounted() {},
  methods: {
    //获取所有内容
    email(uuid) {
      emailValidate(uuid)
        .then((response) => {
          this.loading = false;
          this.success = response.data;
        })
        .catch((response) => {});
      this.goHome();
    },
    goHome() {
      let count = 3; //赋值多少秒
      var times = setInterval(() => {
        count--; //递减
        if (count <= 0) {
          // <=0
          this.$router.push({ path: "/" });
          clearInterval(times);
        }
      }, 1000); //1000毫秒后执行
    },
  },
};
</script>

<style scoped>
.main-full-middle {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}
.tag-group {
  text-align: center;
}
</style>
