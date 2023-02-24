<template>
  <div class="app-container">
    <el-row class="wwfwf">
      <el-col :xs="2" :sm="4" :md="5" :lg="6" :xl="6"
        ><div class="grid-content"></div
      ></el-col>
      <el-col :xs="20" :sm="16" :md="14" :lg="12" :xl="12"
        ><div class="grid-content text">
          信息发布
          <svg
            t="1638266896116"
            class="icon"
            viewBox="0 0 1024 1024"
            version="1.1"
            xmlns="http://www.w3.org/2000/svg"
            p-id="8278"
            width="25"
            height="25"
          >
            <path
              d="M92.734962 77.627741h782.658098v490.920693h77.626035V60.140557A60.138851 60.138851 0 0 0 892.453727 0.001706H75.674295A60.138851 60.138851 0 0 0 15.535444 60.140557v902.935801A60.138851 60.138851 0 0 0 75.674295 1023.641726h390.262757v-77.626035H92.734962z"
              p-id="8279"
              data-spm-anchor-id="a313x.7781069.0.i20"
              class=""
              fill="#515151"
            ></path>
            <path
              d="M996.523796 727.212637L496.219736 537.412717a18.340217 18.340217 0 0 0-23.884933 22.178867l132.646685 451.254642a18.340217 18.340217 0 0 0 28.150101 9.809883l104.070069-73.360868 48.196384 42.651668a18.340217 18.340217 0 0 0 30.709201-12.368984l5.971233-100.657935a17.9137 17.9137 0 0 0-5.544717-14.07505l-235.437204-229.892488 281.927522 202.59542a18.340217 18.340217 0 0 0 20.899317 0l116.439052-78.052551a18.340217 18.340217 0 0 0-3.83865-30.282684zM204.908847 190.65466h550.206511v77.199518H204.908847zM204.908847 383.866714h262.307755v77.199518H204.908847z"
              p-id="8280"
              data-spm-anchor-id="a313x.7781069.0.i21"
              class="selected"
              fill="#90EDCD"
            ></path>
          </svg></div
      ></el-col>
      <el-col :xs="2" :sm="4" :md="5" :lg="6" :xl="6"
        ><div class="grid-content"></div
      ></el-col>
    </el-row>
    <el-col
      :xs="24"
      :sm="{ span: 14, offset: 5 }"
      :md="{ span: 12, offset: 6 }"
    >
      <el-form label-width="120px">
        <el-row class="wwfwf">
          <el-form-item class="dfg" label="分类名：">
            <el-select v-model="contentObj.mid" placeholder="请选择分类">
              <el-option
                v-for="item in metas"
                :key="item.mid"
                :label="item.name"
                :value="item.mid"
              >
              </el-option>
            </el-select>
          </el-form-item>
        </el-row>

        <el-row class="wwfwf">
          <el-form-item class="dfg" label="方式：">
            <el-select v-model="contentObj.ctype" placeholder="请选择方式">
              <el-option
                v-for="item in selectCtype"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              >
              </el-option>
            </el-select>
          </el-form-item>
        </el-row>

        <el-row class="wwfwf">
          <el-form-item class="dfg" label="类型：">
            <el-select v-model="contentObj.type" placeholder="请选择类型">
              <el-option
                v-for="item in selectType"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              >
              </el-option>
            </el-select>
          </el-form-item>
        </el-row>

        <el-row class="wwfwf">
          <el-form-item class="dfg" label="发表内容：">
            <el-input
              type="textarea"
              :autosize="{ minRows: 3, maxRows: 10 }"
              v-model="textConent"
            />
          </el-form-item>
        </el-row>

        <el-row class="wwfwf">
          <div v-if="contentObj.ctype != 0">
            <el-form-item label="">
              <el-upload
                class="upload-demo"
                drag
                ref="upload"
                :action="fileUrl"
                multiple
                :limit="3"
                :on-change="uploadChange"
                list-type="picture"
                :auto-upload="false"
                :data="contentObj"
                :headers="headersObj"
                :with-credentials="true"
                :on-success="uploadSuccess"
                :on-error="uploadError"
                :on-exceed="handleExceed"
              >
                <i class="el-icon-upload"></i>
                <div class="el-upload__text">
                  将文件拖到此处，或<em>点击选择文件</em>
                </div>
                <!-- <div class="el-upload__tip" slot="tip">xxx</div> -->
              </el-upload>
            </el-form-item>
          </div>
        </el-row>

        <el-form-item>
          <el-button type="primary" @click="save">提交</el-button>
        </el-form-item>
      </el-form>
    </el-col>
  </div>
</template>
<style lang="scss" scoped>
</style>

<script>
//引入接口定义的js文件
import operateApi from "@/api/operate";
import touristApi from "@/api/tourist";
import cookie from "js-cookie";
import { getToken } from "@/utils/auth";
export default {
  data() {
    return {
      textConent: "",
      faceShow: false,
      contentObj: { ctype: "0" },
      headersObj: {},
      metas: [], //分类集合
      fileUrl: process.env.NUXT_ENV.API_BASE_URL + "/api/operate/fileUpload",
      selectCtype: [
        {
          value: "0",
          label: "文字",
        },
        {
          value: "1",
          label: "图片",
        },
        {
          value: "2",
          label: "视频",
        },
      ],
      selectType: [
        {
          value: "0",
          label: "不匿名",
        },
        {
          value: "1",
          label: "匿名",
        },
      ],
    };
  },
  //页面渲染之前执行
  created() {
    if (getToken() === undefined) {
      this.$router.push({ path: "/userlogin", query: { id: "1" } });
    }
    this.getMetaAll();
  },
  mounted: function () {
    this.$nextTick(function () {
      //元素加载完成后执行的代码
      let userCookie = cookie.get("campus-token");
      //没登录
      if (userCookie == undefined) {
        //跳转列表页面，使用路由跳转方式实现
        this.$router.push({ path: "/userlogin" });
      }

      this.headersObj["token"] = userCookie;
      this.init();
    });
  },
  methods: {
    //初始化数据
    init() {
      this.contentObj.pictureNum = 0;
    },
    //文件数量超过限制
    handleExceed(files, fileList) {
      this.$message({
        type: "error",
        message: "添加失败，数量超出限制!",
      });
    },
    //上传文件成功
    uploadSuccess(response, file, fileList) {
      this.$message({
        type: "success",
        message: "上传成功",
      });
    },
    //上传文件失败
    uploadError(err, file, fileList) {
      // console.log(err);
      this.$message({
        type: "error",
        message: "上传失败," + err.data,
      });
    },
    //上传文件判断
    uploadChange(file, fileList) {
      // 拿到当前上传图片的name，判断其后缀名是否符合
      let type = this.isImage(file.name);
      let type2 = this.isVideo(file.name);
      // console.log("1" + type);
      // console.log("2" + type2);

      this.fileList = fileList;
      let fileLength = this.fileList.length;

      //如果选择图片
      if (this.contentObj.ctype == 1) {
        if (!type) {
          // 若不符合图片类型，则让当前上传的文件去除掉即可，即从上传对列删除本次上传
          this.fileList.splice(fileLength - 1, 1);
          this.$message.error("只允许上传图片");
        }

        //如果是图片
        if (type) {
          const isLtxM = file.size / 1024 / 1024 < 5;
          if (!isLtxM) {
            this.fileList.splice(fileLength - 1, 1);
            this.$message.error("上传的图片大小不能超过 5MB!");
            return;
          }
        }
      }

      //如果选择视频
      if (this.contentObj.ctype == 2) {
        if (!type2) {
          // 若不符合图片类型，则让当前上传的文件去除掉即可，即从上传对列删除本次上传
          this.fileList.splice(fileLength - 1, 1);
          this.$message.error("只允许上传视频");
        }

        //如果是视频
        if (type2) {
          const isLtxM = file.size / 1024 / 1024 < 10;
          if (!isLtxM) {
            this.fileList.splice(fileLength - 1, 1);
            this.$message.error("上传的视频大小不能超过 10MB!");
          }
        }
        if (fileLength > 1) {
          this.fileList.splice(fileLength - 1, 1);
          this.$message.error("只允许上传1个视频");
        }
      }
      //修改数量
      this.contentObj.pictureNum = this.fileList.length;
    },
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
    isVideo(fileName) {
      if (typeof fileName !== "string") return;
      let name = fileName.toLowerCase();
      return (
        //下面是视频格式的
        name.endsWith(".bmp") ||
        name.endsWith(".mp4") ||
        name.endsWith(".mov") ||
        name.endsWith(".avi")
      );
    },

    //分类列表
    getMetaAll() {
      touristApi
        .getCategoryList()
        .then((response) => {
          this.metas = response.data;
        })
        .catch();
    },
    //添加
    save() {
      //非纯文字的时候，判断数量必须大于 1
      if (this.contentObj.pictureNum < 1 && this.contentObj.ctype != 0) {
        this.$message({
          type: "error",
          message: "请上传文件!",
        });
        return;
      }
      this.contentObj.content = this.textConent;
      operateApi.addContent(this.contentObj).then((response) => {
        //提示
        // this.$message({
        //   type: "success",
        //   message: "添加成功!",
        // });

        this.contentObj.cid = response.data;
        //图文
        if (this.contentObj.ctype == 1 || this.contentObj.ctype == 2) {
          //上传文件
          this.$refs.upload.submit();
        } else {
          this.$router.push({ path: "/User/management?types=1" });
        }
        this.$router.push({ path: "/User/management?types=1" });
      });
      // .catch((response) => {
      //   //添加错误
      //   this.$message({
      //     type: "error",
      //     message: response.message,
      //   });
      // });
    },
  },
};
</script>
<style>
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
.wwfwf {
  padding: 10px;
}
</style>