

<template>
  <div class="wxamp">
    <div>
      <span>使用微信扫一扫登录</span>
      <div style="margin-top: 20px">
        <img :src="imgUrl" class="code-img" />
      </div>
    </div>
  </div>
</template>


<script>
import cookie from "js-cookie";
import userInfoApi from "@/api/userInfo.js";
import { getWxampImg, checkWxamp, wxampLogin } from "@/api/login";
import { getToken, setToken, removeToken } from "@/utils/auth";

export default {
  data() {
    return {
      imgUrl: "",
      uuid: "",
      scanRes: false,
    };
  },
  mounted() {
    this.getImage();
  },
  methods: {
    //获取二维码
    getImage() {
      getWxampImg().then((res) => {
        this.imgUrl = "data:image/gif;base64," + res.img;
        this.uuid = res.uuid;
        this.checkWxamp();
      });
    },
    //判断是否授权
    checkWxamp() {
      var count = 240; //赋值多少秒
      var times = setInterval(() => {
        this.count--; //递减
        this.checkWxampApi();
        //登录成功
        if (this.scanRes) {
          clearInterval(times);
           this.$message.success("登录成功!");
          this.tologin();
        }
        if (count <= 0) {
          clearInterval(times);
        }
      }, 1000); //1000毫秒后执行
    },
    checkWxampApi() {
      checkWxamp(this.uuid).then((res) => {
        this.scanRes = res.msg == "1" ? true : false;
      });
    },
    tologin() {
      wxampLogin(this.uuid).then((res) => {
        setToken(res.token);
        window.close();
      });
    },
  },
};
</script>


<style>
.wxamp {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>