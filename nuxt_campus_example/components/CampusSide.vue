<template>
  <div class="campus-side">
    <div class="campus-side-main">
      <div class="wbpro-side-tit woo-box-flex woo-box-alignCenter">
        <div class="campus-side-title woo-box-item-flex">热度榜</div>
      </div>
      <div class="woo-divider-main woo-divider-x"><!----></div>
      <div class="campus-side-card">
        <div
          v-for="(item, keys) in simpleHotList"
          :key="keys"
          class="campus-side-panel"
          style="padding: 0 18px"
        >
          <el-link :href="'c/' + item.contentId" target="_blank"
            ><div class="con woo-box-flex woo-box-alignCenter">
              <div class="side-rank-num">{{ keys + 1 }}</div>
              <div class="side-f12" style="margin-right: 10px; color: #333">
                {{ item.content }}
              </div>
              <div class="side-f12" style="color: #939393">
                {{ item.loveCount }}
              </div>
            </div>
          </el-link>
          <div class="woo-divider-main woo-divider-x"><!----></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import touristApi from "@/api/tourist";

export default {
  //import引入的组件需要注入到对象中才能使用

  components: {},
  data() {
    //这里存放数据
    return {
      simpleHotList: [],
    };
  },

  //生命周期 - 创建完成（可以访问当前this实例）
  created() {
    this.getSimpleHotContent();
  },
  //方法集合
  methods: {
    getSimpleHotContent() {
      touristApi
        .getSimpleHotContent()
        .then((response) => {
          this.simpleHotList = response.data;
        })
        .catch();
    },
  },
};
</script>
<style>
.campus-side {
  background-color: #fff;
  margin: 20px 0 0 0;
  width: 280px;
  margin-left: 8px;
}
.campus-side-main {
  position: sticky;
   width: 280px;
  top: 45px;
}
.campus-side-card .con {
  position: relative;
  height: 40px;
  padding: 0 30px 0 24px;
  overflow: hidden;
  white-space: nowrap;
}
.wbpro-side-tit {
  height: 40px;
  padding: 0 18px;
}
.campus-side-title {
  align-self: center;
  font-size: 14px;
  line-height: 18px;
}
.side-rank-num {
  font-size: 16px;
  font-weight: 700;
  position: absolute;
  left: 0;
  text-align: center;

  width: 20px;
  color: #ff8200;
}
.side-f12 {
  font-size: 12px;
  line-height: 16px;
}
</style>