<template>
  <div class="footer-container">
    <div class="gcs-footer">
      <div class="x">
        <p>
          开源地址：<a href="https://gitee.com/oddfar/campus"
            >https://gitee.com/oddfar/campus</a
          >
        </p>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      nowtime: new Date(),
    };
  },
  methods: {},
  // 销毁定时器
  beforeDestroy() {
    if (this.timer) {
      clearInterval(this.timer);
    }
  },
};
</script>

<style>
.footer-container {
  border-radius: 10px;
  background: rgba(116, 107, 107, 0.5);
  height: 100%;
}
.gcs-footer {
  padding: 5px;
  text-align: center;
  color: white;
}
.footer-top a {
  font-weight: bold;
  font-size: 10px;
  color: #f0f1f1;
  text-decoration: none;
  padding: 0 10px;
  vertical-align: middle;
}
.gcs-footer a:hover {
  color: rgb(3, 64, 114);
  font-weight: bold;
  text-decoration: blink;
}
.gcs-footer p {
  font-size: 10px;
  color: #5f5e5e;
}
.x a {
  font-weight: bold;
  color: #050505;
  text-decoration: none;
}
.x a:hover {
  font-weight: bold;
  color: #050505;
  text-decoration: none;
}
</style>
