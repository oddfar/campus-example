<template>
  <div class="main-full-middle">
    <div style="width:642px;">
      <!-- 消息盒子 -->
      <Content
        :contentObj="contentObj"
        v-if="contentObj != null"
        :loveContentIds="loveContentIds"
      ></Content>
    </div>
  </div>
</template>

<script>
//api
import touristApi from "@/api/tourist";

//引用组件
import Content from "@/components/Content";

export default {
  components: { Content },
  data() {
    return {
      //墙内容
      contentObj: null,
      //点赞的墙列表
      loveContentIds: [],
      contentId: "",
    };
  },

  //创建的时候自动调用
  created() {
    this.contentId = this.$route.params.contentId;
    this.getContent(this.contentId);
  },
  //创建后
  mounted() {},
  methods: {
    //获取所有内容
    getContent(contentId) {
      touristApi
        .getContentById(contentId)
        .then((response) => {
          let isLove = response.isLove;
          if (isLove) {
            this.loveContentIds.push(contentId);
          }
          this.contentObj = response.data;
        })

        .catch((response) => {});
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
