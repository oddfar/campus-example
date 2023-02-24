<template>
  <div class="app-container">
    <el-container>
      <!-- 顶栏容器 -->
      <el-header height="60px;">
        <!-- 公共头 -->
        <myheader />
      </el-header>
      <!-- 分割线 -->
      <!-- 主要区域容器 -->
      <el-main style="padding: 0px; margin-top: 0px">
        <div class="main-container">
          <nuxt />
        </div>
      </el-main>
      <!-- 底栏容器 -->
      <!-- <el-footer>
        <myfooter />
      </el-footer> -->
    </el-container>
  </div>
</template>
<script>
import myheader from "./myheader";
import myfooter from "./myfooter";
export default {
  components: {
    myheader,
    myfooter,
  },
};
</script>
<style>
.el-container {
  min-height: 100vh;
  background-color: #f5f5f5;
}
.el-main {
  overflow: visible !important;
}
/* .el-message {
  z-index: 99999999 !important;
}
.el-notification {
  z-index: 99999999 !important;
} */
</style>
