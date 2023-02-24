<template>
  <div style="margin: 20px 8px 0 0">
    <div class="campus-menu" :style="{ height: menuHeight + 'px' }">
      <div>
        <h2 class="nav-title">首页</h2>
        <el-menu
          style="width: 182px"
          default-active="1"
          @select="handleSelectMenu"
          :unique-opened="true"
          class="el-menu-vertical"
          background-color="#ffffff"
          text-color="#000000"
          active-text-color="#d2691e"
        >
          <div v-for="(item, i) in categoryTree" :key="i">
            <el-submenu v-if="item.children != null" :index="item.categoryId">
              <template slot="title">
                <svg-icon style="margin-right: 18px" :icon-class="item.icon" />
                <span>{{ item.categoryName }}</span>
              </template>
              <el-menu-item
                v-for="(child, i) in item.children"
                :key="i"
                :index="child.categoryId"
              >
                <svg-icon style="margin-right: 18px" :icon-class="item.icon" />
                <span>{{ child.categoryName }}</span>
              </el-menu-item>
            </el-submenu>

            <el-menu-item v-else :index="item.categoryId">
              <template slot="title">
                <svg-icon style="margin-right: 18px" :icon-class="item.icon" />
                <span>{{ item.categoryName }}</span>
              </template>
            </el-menu-item>
          </div>

          <!-- <el-submenu index="5">
        <template slot="title">我的工作台</template>
        <el-menu-item index="2-1">选项1</el-menu-item>
        <el-menu-item index="2-2">选项2</el-menu-item>
        <el-menu-item index="2-3">选项3</el-menu-item>
      </el-submenu>
      <el-menu-item index="2">
        <i class="el-icon-menu"></i>
        <span slot="title">导航二</span>
      </el-menu-item> -->
        </el-menu>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  //import引入的组件需要注入到对象中才能使用
  components: {},
  props: ["categoryObj"],
  data() {
    //这里存放数据
    return {
      categoryTree: [],
      //选中的菜单id
      selectMenuId: null,
      menuHeight: "",
      screenWidth: null,
    };
  },
  watch: {
    screenWidth: function (n, o) {
      if (n < 720) {
      } else {
      }
    },
  },
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {
    this.categoryTree = this.handleTree(this.categoryObj, "categoryId");
    this.menuHeight = document.documentElement.clientHeight - 45;
  },
  mounted() {
    this.screenWidth = document.documentElement.clientWidth;
    window.onresize = () => {
      //屏幕尺寸变化
      return (() => {
        this.screenWidth = document.documentElement.clientWidth;
      })();
    };
  },
  //方法集合
  methods: {
    //点击菜单
    handleSelectMenu(key, keyPath) {
      /**
       *  传递值“子向父组件传值”
       * this.$emit("事件命名", data);
       * <CampusMenu v-on:"事件命名"="接受的方法()"></CampusMenu>
       */
      if (this.selectMenuId != key) {
        this.selectMenuId = key;
        this.$emit("handleCategory", key);
      }
    },
  },
};
</script>
<style>
.campus-menu {
  box-shadow: 0px 0px 25px rgb(0 0 0 / 10%);
  position: sticky;
  top: 45px;
  background-color: #fff;
}
.nav-title {
  margin: 0;
  padding: 10px 16px;
  line-height: 26px;
  font-size: 22px;
  font-weight: 500;
}
.el-menu-vertical:not(.el-menu--collapse) {
  width: 182px;
}
</style>