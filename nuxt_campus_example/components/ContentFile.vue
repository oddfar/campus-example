<template>
  <div class="ContentFile" id="fileWidth">
    <div class="picture file-row" v-if="contentType == 1">
      <div class="picture_item" v-for="(item, key) in fileList" :key="key">
        <el-image
          :style="image.style"
          :fit="image.fit"
          :src="item"
          :preview-src-list="fileList"
        >
        </el-image>
      </div>
    </div>

    <div v-if="contentType == 2">
      <video
        style="border-radius: 10px"
        align="center"
        :loop="true"
        :autoplay="false"
        width="100%"
        :height="videoHeight"
        aspectRatio="16:9"
        :fluid="true"
        preload="none"
        :muted="false"
        :controls="true"
      >
        <source :src="fileList[0]" type="video/mp4" />
        您的浏览器不支持视频标签！
      </video>
    </div>
  </div>
</template>

<script>
export default {
  name: "ContentFile",
  props: ["fileUrls", "contentType"],
  components: {},
  data() {
    //这里存放数据
    return {
      host: process.env.NUXT_ENV.API_BASE_URL,
      //图片样式
      image: {
        style: "border-radius: 10px; position: static; width: 33%",
        fit: "contain",
      },
      //视频样式
      videoHeight: "300px;",
      //修改后的文件列表
      fileList: "",
    };
  },
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {
    this.setFileStyle();
    this.setFileUrls();
  },
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
    var div = document.getElementById("fileWidth");
  },

  //方法集合
  methods: {
    //设置样式
    setFileStyle() {
      let width = document.documentElement.clientWidth;
      let height = document.documentElement.clientHeight;
      if (width < 642) {
        this.videoHeight =  "162px;";
      }
    },
    //处理url
    setFileUrls() {
      this.fileList = this.fileUrls.map((item) => {
        if (item.trim().startsWith("http") == false) {
          return (item = this.host + item);
        }
      });
      if (this.fileList.length > 1) {
        this.image.style = "border-radius: 10px; width: 25%;aspect-ratio:1/1";
        this.image.fit = "cover";
      }
    },
  },
};
</script>
<style>
.picture_item {
  display: inline;
  padding-left: 0.25rem;
  padding-top: 0.25rem;
}
</style>