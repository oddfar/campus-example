
<template>
  <div class="app-container">
    <el-row>
      <el-col :xs="2" :sm="4" :md="5" :lg="6" :xl="6"
        ><div class="grid-content"></div
      ></el-col>
      <el-col :xs="20" :sm="16" :md="14" :lg="12" :xl="12"
        ><div class="grid-content text" style="padding-bottom: 20px">
          用户设置
          <svg
            t="1638274029049"
            class="icon"
            viewBox="0 0 1024 1024"
            version="1.1"
            xmlns="http://www.w3.org/2000/svg"
            p-id="2368"
            width="30"
            height="30"
          >
            <path
              d="M950.633412 155.602824H73.366588A73.456941 73.456941 0 0 0 0 228.969412v561.031529a73.441882 73.441882 0 0 0 73.366588 73.366588h877.266824A73.441882 73.441882 0 0 0 1024 790.000941V228.969412a73.456941 73.456941 0 0 0-73.366588-73.366588zM993.882353 790.000941a43.294118 43.294118 0 0 1-43.248941 43.248941H73.366588A43.294118 43.294118 0 0 1 30.117647 790.000941V228.969412a43.294118 43.294118 0 0 1 43.248941-43.248941h877.266824A43.294118 43.294118 0 0 1 993.882353 228.969412v561.031529z"
              p-id="2369"
              fill="#515151"
            ></path>
            <path
              d="M150.362353 589.718588c34.063059 12.016941 83.215059 15.224471 106.902588 15.224471 25.825882 0 76.378353-4.186353 110.095059-15.841883 16.850824-6.460235 20.389647-17.468235 20.389647-25.569882 0-59.964235-41.140706-110.366118-96.632471-124.822588 23.552-11.956706 39.875765-36.156235 39.875765-64.316235 0-39.905882-32.466824-72.387765-72.387765-72.387765s-72.387765 32.466824-72.387764 72.387765c0 28.16 16.338824 52.359529 39.875764 64.316235-55.491765 14.471529-96.632471 64.858353-96.63247 124.822588 0.030118 16.353882 11.670588 21.865412 20.901647 26.187294z m50.928941-215.326117c0-31.608471 25.720471-57.328941 57.328941-57.328942s57.328941 25.720471 57.328941 57.328942-25.720471 57.328941-57.328941 57.328941-57.328941-25.735529-57.328941-57.328941z m57.328941 75.068235c62.900706 0 114.070588 51.169882 114.070589 114.070588 0 3.659294-1.28 7.890824-10.480942 11.429647-31.503059 10.872471-81.091765 14.923294-104.944941 14.923294-22.723765 0-69.737412-3.026824-101.180235-14.08-9.712941-4.592941-11.550118-6.550588-11.550118-12.272941 0.015059-62.900706 51.184941-114.070588 114.085647-114.070588zM451.764706 328.779294c0 4.141176 6.776471 7.529412 15.058823 7.529412h391.529412c8.282353 0 15.058824-3.388235 15.058824-7.529412s-6.776471-7.529412-15.058824-7.529412H466.823529c-8.282353 0-15.058824 3.388235-15.058823 7.529412zM451.764706 449.249882c0 4.141176 6.776471 7.529412 15.058823 7.529412h391.529412c8.282353 0 15.058824-3.388235 15.058824-7.529412s-6.776471-7.529412-15.058824-7.529411H466.823529c-8.282353 0-15.058824 3.388235-15.058823 7.529411zM451.764706 569.720471c0 4.141176 6.776471 7.529412 15.058823 7.529411h391.529412c8.282353 0 15.058824-3.388235 15.058824-7.529411s-6.776471-7.529412-15.058824-7.529412H466.823529c-8.282353 0-15.058824 3.388235-15.058823 7.529412zM135.529412 690.191059c0 4.141176 6.776471 7.529412 15.058823 7.529412h707.764706c8.282353 0 15.058824-3.388235 15.058824-7.529412s-6.776471-7.529412-15.058824-7.529412H150.588235c-8.282353 0-15.058824 3.388235-15.058823 7.529412z"
              p-id="2370"
              fill="#1296db"
              data-spm-anchor-id="a313x.7781069.0.i0"
              class=""
            ></path>
          </svg></div
      ></el-col>
      <el-col :xs="2" :sm="4" :md="5" :lg="6" :xl="6"
        ><div class="grid-content"></div
      ></el-col>
    </el-row>
    <el-row>
      <el-col :xs="0" :sm="9" :md="9" :lg="9" :xl="9"
        ><div class="grid-content"></div
      ></el-col>
      <el-col :xs="24" :sm="10" :md="10" :lg="10" :xl="10"
        ><div class="grid-content">
          <el-form label-width="80px">
            <el-form-item
              label="昵称:"
              class="dfg"
              style="padding-bottom: 20px"
            >
              <el-input v-model="loginVo.userName" style="width: 220px" />
            </el-form-item>

            <el-form-item label="修改头像:" class="dfg">
              <el-upload
                class="avatar-uploader"
                ref="upload"
                :action="fileUrl"
                :show-file-list="false"
                :on-change="beforeAvatarUpload"
                :auto-upload="false"
                with-credentials="true"
                :headers="headersObj"
                :on-success="handleAvatarSuccess"
                :on-error="uploadError"
              >
                <img v-if="imageUrl" :src="imageUrl" class="avatar" />
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="updateUser">保存</el-button>
            </el-form-item>
          </el-form>
        </div></el-col
      >
      <el-col :xs="0" :sm="5" :md="5" :lg="5" :xl="5"
        ><div class="grid-content"></div
      ></el-col>
    </el-row>
  </div>
</template>
<script>
import apiUserInfo from "@/api/userInfo";
import cookie from "js-cookie";
export default {
  data() {
    return {
      loginVo: { userName: "" },
      fileUrl: process.env.NUXT_ENV.API_BASE_URL + "/api/operate/headPortrait",
      imageUrl: "",
      headersObj: {},
    };
  },
  //创建的时候自动调用
  created() {
    let token = cookie.get("campus-token");
    if (typeof token === "undefined") {
      this.$router.push({ path: "/userlogin", query: { id: "1" } });
    }
    // this.headersObj.token = token;
    this.info();
  },
  methods: {
    //获取用户信息
    info() {
      apiUserInfo.getInfo().then((response) => {
        this.loginVo.userName = response.data.userName;
        this.userName = response.data.userName;
        this.imageUrl = response.data.imageUrl;
      });
    },
    updateUser() {
      //修改昵称
      if (this.loginVo != "") {
        apiUserInfo.ChangeName(this.loginVo).then((response) => {
          this.$message.success("保存成功！");
          //修改成功：
        });
      } else {
        this.$message.search("昵称不能为空！");
      }
      //  !=-1 为找到,则 已经更改头像
      if (this.imageUrl.search("blob:http") != -1) {
        this.$refs.upload.submit();
      }
    },

    //上传成功
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.$message.success("头像上传成功");
      // this.$router.go(0);
      location.reload();
    },
    //上传图片判断
    beforeAvatarUpload(file, fileList) {
      this.fileLength = fileList.length;
      // const isJPG = file.type === 'image/jpeg';
      let isImage = this.isImage(file.name);
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isImage) {
        this.$message.error("只能上传图片!");
        isImage = false;
      } else {
        isImage = true;
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      if (isImage && isLt2M) {
        this.imageUrl = URL.createObjectURL(file.raw);
        // console.log(this.imageUrl);
      }
      return isImage && isLt2M;
    },
    //上传文件失败
    uploadError(err, file, fileList) {
      // console.log(err);
      this.$message({
        type: "error",
        message: "上传失败," + err.data,
      });
    },
    //是否是图片
    isImage(fileName) {
      if (typeof fileName !== "string") return;
      let name = fileName.toLowerCase();
      return (
        name.endsWith(".png") ||
        name.endsWith(".jpeg") ||
        name.endsWith(".jpg") ||
        name.endsWith(".png")
      );
    },
  },
};
</script>
<style>
/* 头像 */
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
.text2 {
  text-align: center;
}
.dfg {
  margin: 0 20px 0 20px;
  font-weight: bolder;
}

.texts {
  font-weight: bolder;
}
.text {
  font-size: 20px;
  text-align: center;
  font-weight: bolder;
}
.el-col {
  border-radius: 4px;
}
.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
</style>