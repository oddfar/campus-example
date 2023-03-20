<template>
  <div>
    <client-only>
      <div class="user-info-head" @click="editCropper()">
        <img
          v-bind:src="options.img"
          title="点击上传头像"
          class="img-circle img-lg"
        />
      </div>
      <el-dialog
        v-if="open"
        :title="title"
        :visible.sync="open"
        width="800px"
        append-to-body
        @opened="modalOpened"
        @close="closeDialog"
      >
        <el-row>
          <el-col :xs="24" :md="12" :style="{ height: '350px' }">
            <client-only>
              <VueCropper
                ref="cropper"
                :img="options.img"
                :info="true"
                :autoCrop="options.autoCrop"
                :autoCropWidth="options.autoCropWidth"
                :autoCropHeight="options.autoCropHeight"
                :fixedBox="options.fixedBox"
                @real-time="realTimeImg"
                v-if="visible"
              />
            </client-only>
          </el-col>
          <el-col :xs="24" :md="12" :style="{ height: '350px' }">
            <div class="avatar-upload-preview">
              <img :src="previews.url" :style="previews.img" />
            </div>
          </el-col>
        </el-row>
        <br />
        <el-row>
          <el-col :lg="2" :md="2">
            <el-upload
              action="#"
              :http-request="requestUpload"
              :show-file-list="false"
              :before-upload="beforeUpload"
            >
              <el-button size="small">
                选择
                <i class="el-icon-upload el-icon--right"></i>
              </el-button>
            </el-upload>
          </el-col>
          <el-col :lg="{ span: 1, offset: 2 }" :md="2">
            <el-button
              icon="el-icon-plus"
              size="small"
              @click="changeScale(1)"
            ></el-button>
          </el-col>
          <el-col :lg="{ span: 1, offset: 1 }" :md="2">
            <el-button
              icon="el-icon-minus"
              size="small"
              @click="changeScale(-1)"
            ></el-button>
          </el-col>
          <el-col :lg="{ span: 1, offset: 1 }" :md="2">
            <el-button
              icon="el-icon-refresh-left"
              size="small"
              @click="rotateLeft()"
            ></el-button>
          </el-col>
          <el-col :lg="{ span: 1, offset: 1 }" :md="2">
            <el-button
              icon="el-icon-refresh-right"
              size="small"
              @click="rotateRight()"
            ></el-button>
          </el-col>
          <el-col :lg="{ span: 2, offset: 6 }" :md="2">
            <el-button type="primary" size="small" @click="uploadImg()"
              >提 交</el-button
            >
          </el-col>
        </el-row>
      </el-dialog>
    </client-only>
  </div>
</template>

<script>
import userInfoApi from "@/api/userInfo";
// const VueCropper = (resolve) => resolve(require("vue-cropper"));

export default {
  props: {
    user: {
      type: Object,
    },
  },
  // components: { VueCropper },
  data() {
    return {
      // 是否显示弹出层
      open: false,
      // 是否显示cropper
      visible: false,
      // 弹出层标题
      title: "修改头像",
      options: {
        img: "", //裁剪图片的地址
        autoCrop: true, // 是否默认生成截图框
        autoCropWidth: 200, // 默认生成截图框宽度
        autoCropHeight: 200, // 默认生成截图框高度
        fixedBox: true, // 固定截图框大小 不允许改变
      },
      previews: {},
    };
  },
  created() {
    if (process.client) {
    }
    // this.options.img = this.handleCampusUrl(news.avatar);
  },
  watch: {
    user(news, olds) {
      this.options.img = this.handleCampusUrl(news.avatar);
    },
  },
  methods: {
    // 编辑头像
    editCropper() {
      this.open = true;
      this.visible = true;
    },
    // 打开弹出层结束时的回调
    modalOpened() {
      this.visible = true;
    },
    // 覆盖默认的上传行为
    requestUpload() {},
    // 向左旋转
    rotateLeft() {
      this.$refs.cropper.rotateLeft();
    },
    // 向右旋转
    rotateRight() {
      this.$refs.cropper.rotateRight();
    },
    // 图片缩放
    changeScale(num) {
      num = num || 1;
      this.$refs.cropper.changeScale(num);
    },
    // 上传预处理
    beforeUpload(file) {
      if (file.type.indexOf("image/") == -1) {
        this.$modal.msgError(
          "文件格式错误，请上传图片类型,如：JPG，PNG后缀的文件。"
        );
      } else {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => {
          this.options.img = reader.result;
        };
      }
    },
    // 上传图片
    uploadImg() {
      this.$refs.cropper.getCropBlob((data) => {
        let formData = new FormData();
        formData.append("avatarfile", data);
        userInfoApi.uploadAvatar(formData).then((response) => {
          this.open = false;
          this.options.img = this.handleCampusUrl(response.imgUrl);
          // store.commit('SET_AVATAR', this.options.img);
          this.$modal.msgSuccess("修改成功");
          this.visible = false;
        });
      });
    },
    // 实时预览
    realTimeImg(data) {
      this.previews = data;
    },
    // 关闭窗口
    closeDialog() {
      this.options.img = this.handleCampusUrl(this.user.avatar);
      this.visible = false;
    },
  },
};
</script>
<style scoped>
.user-info-head {
  position: relative;
  display: inline-block;
  height: 120px;
}

.user-info-head:hover::after {
  content: "+";
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  color: #eee;
  background: rgba(0, 0, 0, 0.5);
  font-size: 24px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  cursor: pointer;
  line-height: 110px;
  border-radius: 50%;
}
/* image */
.img-circle {
  border-radius: 50%;
}

.img-lg {
  width: 120px;
  height: 120px;
}

.avatar-upload-preview {
  position: absolute;
  top: 50%;
  transform: translate(50%, -50%);
  width: 200px;
  height: 200px;
  border-radius: 50%;
  box-shadow: 0 0 4px #ccc;
  overflow: hidden;
}
</style>