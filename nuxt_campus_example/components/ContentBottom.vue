<template>
  <div class="ContentBottom">
    <div
      class="content-bootom-svg woo-box-flex woo-box-alignCenter"
      style="margin: 10px 15px 15px 0px"
    >
      <!-- 分享链接 -->
      <div class="woo-box-item-flex">
        <div
          class="
            content-bottom-hover
            woo-box-flex woo-box-alignCenter woo-box-justifyCenter
          "
          @click="copys($event, contentObj.contentId)"
        >
          <div class="woo-pop-wrap">
            <img width="20" height="20" src="~/assets/images/fenxiang.png" />
            <span>分享链接</span>
          </div>
        </div>
      </div>
      <!-- 评论 -->
      <div class="woo-box-item-flex">
        <div
          class="
            content-bottom-hover
            woo-box-flex woo-box-alignCenter woo-box-justifyCenter
          "
          @click="clickComment()"
        >
          <div class="woo-pop-wrap">
            <img width="20" height="20" src="~/assets/images/pinlun.png" />
            <!-- <svg-icon style="width: 18; height: 18" icon-class="comment" /> -->
            <span>评论</span>
          </div>
        </div>
      </div>
      <!-- 赞 -->
      <div class="woo-box-item-flex">
        <div
          class="
            content-bottom-hover
            woo-box-flex woo-box-alignCenter woo-box-justifyCenter
          "
          @click="setZan(contentObj.contentId)"
        >
          <div class="woo-pop-wrap">
            <img width="20" height="20" :src="zanImg" />
            <span class="zan-num">{{ contentObj.loveCount }}</span>
          </div>
        </div>
      </div>
    </div>
    <!-- 评论列表 -->
    <div v-if="showComment">
      <Comment :contentObj="contentObj"></Comment>
    </div>
  </div>
</template>

<script>
const dzNotImage = require('~/assets/images/dz.png')
const dzImage = require('~/assets/images/dz1.png')

import operateApi from "@/api/operate";

//复制
import Clipboard from "clipboard";
//认证
import { getToken, setToken, removeToken } from "@/utils/auth";
//组件
import Comment from "@/components/Comment";

export default {
  name: "ContentBottom",
  props: ["zanBoolean", "contentObj"],
  //import引入的组件需要注入到对象中才能使用
  components: { Comment },
  data() {
    //这里存放数据
    return {
      //点赞/没点赞的图片地址
      zanImg: "",
      //是否显示评论
      showComment: false,
      isZanBoo:false,
    };
  },
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {},
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
    this.isZanBoo = this.zanBoolean;
    this.isZan();
    if (this.$route.name == 'c-contentId') {
      this.showComment = true;
    }
  },
  //方法集合
  methods: {
    //判断是否被点赞
    isZan() {
      if (this.isZanBoo == false) {
        this.zanImg = dzNotImage;
        return false;
      } else {
        this.zanImg = dzImage;
        return true;
      }
    },
    //点击评论
    clickComment() {
      this.showComment = !this.showComment;
    },
    //点赞
    setZan(contentId) {
      if (getToken() === undefined) {
        this.$router.push({ path: "/userlogin", query: { id: "1" } });
      } else {
        if (this.isZanBoo == true) {
          //取消点赞
          this.isZanBoo = false;

          this.contentObj.loveCount--;
        } else {
          //设置点赞
          this.isZanBoo = true;
          this.contentObj.loveCount++;
        }
        this.isZan(contentId);
        //发送api
        operateApi.zanContent(contentId).then((response) => {
          if (response.data == 1) {
            //点赞
          }
          if (response.data == 0) {
            //取消点赞
          }
        });
      }
    },
    //复制分享链接
    copys(e, contentId) {
      const hostname = window.location.origin;
      const clipboard = new Clipboard(e.target, {
        text: () => hostname + "/c/" + contentId,
      });
      clipboard.on("success", (e) => {
        const h = this.$createElement;
        this.$notify({
          title: "复制成功：",
          message: h("i", { style: "color: teal" }, "快去分享给好盆友吧!"),
        });
        // 释放内存
        clipboard.destroy();
      });

      clipboard.on("error", (e) => {
        // 不支持复制
        Message({
          message: "该浏览器不支持自动复制",
          type: "warning",
        });
        // 释放内存
        clipboard.destroy();
      });
    },
  },
};
</script>
<style>
.content-bootom-svg {
  font-size: 10px;
  font-weight: bolder;
  color: rgb(110, 110, 110);
}
.zan-num {
  font-weight: bolder;
  cursor: pointer;
  font-size: 10px;
  margin-left: 5px;
}
.content-bottom-hover {
  cursor: pointer;
  color: rgb(110, 110, 110);
}
.content-bottom-hover:hover {
  color: coral;
}
</style>