<template>
  <div class="Comment">
    <div style="margin: 15px 20px 0"><!----></div>

    <!-- 评论框 -->
    <div class="woo-box-flex" style="margin: 0 10px">
      <div>
        <el-avatar
          class="content-box-avatar"
          shape="circle"
          :size="40"
          :src="handleCampusUrl(contentObj.params.avatar)"
        ></el-avatar>
      </div>

      <div class="woo-box-item-flex">
        <div>
          <div class="woo-box-item-flex" style="align-self: center">
            <el-input
              type="textarea"
              :autosize="{ minRows: 1.3, maxRows: 5 }"
              placeholder="发布你的评论"
              v-model="toCommentQuery.coContent"
              maxlength="100"
              show-word-limit
            >
            </el-input>
          </div>

          <div style="margin-top: 10px">
            <div class="woo-box-flex woo-box-alignCenter">
              <div class="woo-box-item-flex" style="align-self: center"></div>
              <el-button
                type="primary"
                round
                :disabled="toCommentQuery.coContent.length <= 0"
                @click="addComment()"
              >
                评论
              </el-button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="comment-list">
      <!-- 评论列表 -->
      <div
        class="comment-item"
        v-for="(item, keys) in commentOneLevelList"
        :key="keys"
        style="margin-top: 20px"
      >
        <div class="woo-box-flex">
          <!-- 头像 -->
          <el-avatar
            shape="circle"
            :size="40"
            :src="handleCampusUrl(item.avatar)"
          ></el-avatar>
          <!-- 昵称、评论内容、时间 -->
          <div class="woo-box-item-flex" style="margin: -2px 0 0 10px">
            <div>
              <span class="comment-nick"> {{ item.userNickName }}</span>
              <!-- 是否是作者 -->
              <span
                class="comment-item-tag"
                v-if="item.userId == contentObj.userId"
                style="background: rgb(254, 44, 85)"
                ><span>作者</span>
              </span>
            </div>

            <div style="margin-top: 4px">
              {{ item.coContent }}
            </div>

            <div
              class="comment-info woo-box-flex woo-box-alignCenter woo-box-justifyBetween"
            >
              <div>
                <span> {{ handelTimeFormat(item.createTime) }} </span>
                <span>·{{ item.address }}</span>
              </div>
              <!-- 删除 回复 -->
              <div class="woo-box-flex" style="margin-right: 20px">
                <div
                  class="comment-iconbed woo-box-flex woo-box-alignCenter woo-box-justifyCenter"
                >
                  <svg-icon
                    class="comment-tool-iconbed"
                    v-if="item.userId == loginUserId"
                    icon-class="delete"
                  />
                </div>
                <!-- 添加子评论 -->
                <div
                  class="comment-iconbed woo-box-flex woo-box-alignCenter woo-box-justifyCenter"
                  @click="openCommentChild(item.commentId)"
                >
                  <svg-icon class="comment-tool-iconbed" icon-class="comment" />
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 更多回复 -->
        <div class="comment-more-replies">
          <div class="comment-more-list">
            <div class="comment-more-item">
              <!-- 作者评论内容 -->
              <div v-if="item.children !== undefined">
                <CommentUser
                  :commentObj="item.children[0]"
                  :contentObj="contentObj"
                  @co-success="commentSuccess"
                ></CommentUser>
              </div>
            </div>

            <!-- 更多评论的数量 -->
            <div
              class="comment-more-item"
              v-if="item.childrenCount > 1"
              @click="showChildren(item)"
            >
              <div style="color: #eb7350; text-align: left">
                <span
                  >共{{
                    item.children == undefined
                      ? item.childrenCount
                      : item.childrenCount
                  }}条回复</span
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 查看全部回复 -->
    <div v-if="this.$route.name == 'index' && commentTotal != 0">
      <div
        class="woo-divider-main woo-divider-x"
        style="margin: 7px 20px 0 20px"
      >
        <!---->
      </div>
      <nuxt-link :to="'/c/' + contentObj.contentId">
        <div
          class="woo-box-flex woo-box-alignCenter woo-box-justifyCenter CommentFeed_more"
        >
          <div>查看全部{{ commentTotal }}条评论</div>
          <i class="woo-font woo-font--angleRight"></i>
        </div>
      </nuxt-link>
    </div>
    <!-- 暂无评论 -->
    <div v-if="commentTotal == 0"></div>

    <!-- 分页 -->
    <div class="fenye" v-if="this.$route.name == 'c-contentId'">
      <el-pagination
        :hide-on-single-page="true"
        background
        layout="prev, pager, next"
        :total="total"
        :current-page="currentPage"
        :page-size="5"
        @current-change="handleCurrentChange"
      >
      </el-pagination>
    </div>

    <!-- 评论弹出框 -->
    <el-dialog title="回复" :visible.sync="dialog" width="600px">
      <div class="woo-box-item-flex" style="align-self: center">
        <el-input
          type="textarea"
          placeholder="发布你的回复"
          :autosize="{ minRows: 2, maxRows: 5 }"
          v-model="dialogText"
          maxlength="100"
          show-word-limit
        >
        </el-input>
      </div>
      <div class="woo-box-flex woo-box-alignCenter">
        <div class="woo-box-item-flex" style="align-self: center"></div>
        <el-button
          type="primary"
          round
          style="margin-top: 15px"
          :disabled="dialogText.length <= 0"
          @click="addCommentChild()"
        >
          回复
        </el-button>
      </div>
    </el-dialog>

    <!-- 子评论内容弹出框 -->
    <el-dialog title="回复列表" :visible.sync="dialogChildren" width="600px">
      <div>
        <CommentChild
          :commentObj="commentOneLevelObj"
          :contentObj="contentObj"
        ></CommentChild>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import touristApi from "@/api/tourist";
import operateApi from "@/api/operate";

import { getToken, setToken, removeToken } from "@/utils/auth";
//组件
import CommentUser from "@/components/CommentUser";
import CommentChild from "@/components/CommentChild";

export default {
  name: "Comment",
  props: ["contentObj"],
  components: { CommentUser, CommentChild },
  data() {
    //这里存放数据
    return {
      commentOneLevelList: null,
      //评论请求参数
      commentQuery: {
        contentId: "",
        pageNum: 1,
      },
      //添加评论参数
      toCommentQuery: {
        contentId: null,
        commentId: null,
        coContent: "",
      },
      //登录账户的用户id
      loginUserId: 0,
      //评论总数量
      commentTotal: 0,
      //****无限滚动,后续更改 */
      scrollLoading: false,
      scrollNoMore: false,
      //****分页 */
      total: 0, //一级评论数量
      currentPage: 1,
      //****评论弹出框 */
      dialog: false,
      dialogText: "",
      dialogCommentId: "",
      //子评论列表弹出框
      dialogChildren: false,
      //一级评论内容
      commentOneLevelObj: {},
    };
  },
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {
    this.getCommentList(this.currentPage);
  },
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
    if (getToken() !== undefined) {
      this.loginUserId = this.globalVariable.userInfoGlobal.userId;
    }
  },
  //方法集合
  methods: {
    //加载一级评论
    getCommentList(currentPage) {
      this.commentQuery.contentId = this.contentObj.contentId;
      this.commentQuery.pageNum = currentPage;
      touristApi.getOneLevelComment(this.commentQuery).then((response) => {
        this.commentOneLevelList = this.handleTree(response.rows, "commentId");
        this.commentTotal = parseInt(response.allTotal);
        this.total = parseInt(response.total);
      });
    },
    //当页数改变的时候
    handleCurrentChange(val) {
      this.currentPage = val;
      this.getCommentList(this.currentPage);
    },
    //评论成功后
    commentSuccess(response) {
      this.handleCurrentChange(1);
    },
    //添加评论
    addComment() {
      this.toCommentQuery.commentId = null;
      this.toCommentQuery.contentId = this.contentObj.contentId;
      operateApi.toComment(this.toCommentQuery).then((response) => {
        this.$message({
          type: "success",
          message: "评论成功!",
        });
        this.toCommentQuery.coContent = "";
        this.getCommentList(1);
      });
    },
    //添加子评论
    openCommentChild(commentId) {
      this.dialog = true;
      this.dialogCommentId = commentId;
    },
    addCommentChild() {
      this.toCommentQuery.commentId = this.dialogCommentId;
      this.toCommentQuery.contentId = null;
      this.toCommentQuery.coContent = this.dialogText;
      this.dialog = false;
      operateApi.toComment(this.toCommentQuery).then((response) => {
        this.$message({
          type: "success",
          message: "评论成功!",
        });
        this.dialogText = "";
        this.toCommentQuery.coContent = "";
        this.currentPage = 1;
        this.getCommentList(this.currentPage);
      });
    },
    //查看子评论
    showChildren(commentObj) {
      this.commentOneLevelObj = commentObj;
      this.dialogChildren = true;
    },
  },
};
</script>
<style>
.comment-nick {
  font-weight: bolder;
  font-size: 12px;
  color: #eb7350;
  text-align: left;
}
.comment-list {
  font-size: 12px;
  /* font-weight: bolder; */
  line-height: 20px;
  color: #333;
}
.comment-info {
  height: 22px;
  margin: 1px 0 0;
  color: #939393;
}
.comment-iconbed {
  width: 22px;
  height: 22px;
  margin: 0 0 0 10px;
}
.comment-more-replies {
  position: relative;
  margin: 6px 0 2px 44px;
}
.comment-more-replies::before {
  content: "";
  position: absolute;
  top: 4px;
  bottom: 4px;
  left: 0;
  border-left: 2px solid #f2f2f2;
}
.comment-more-list {
  padding: 0 0 0px 10px;
  line-height: 20px;
  font-size: 12px;
}
.composer_btn {
  width: 68px;
  padding-left: 0 !important;
  padding-right: 0 !important;
}
/* 作者标签 */
.comment-item-tag {
  flex-shrink: 0;
  font-size: 10px;
  height: 16px;
  margin-left: 8px;
  color: #fff;

  align-items: center;
  border-radius: 4px;
  display: inline-flex;
  font-weight: 500;
  justify-content: center;
  line-height: 20px;
  padding: 0 4px;
}
/* 工具栏图标 */
.comment-tool-iconbed {
  font-size: 14px;
  color: grey;
}
.CommentFeed_more {
  height: 44px;
  background: #fff;
  font-size: 14px;
  color: #333;
  cursor: pointer;
}
.CommentFeed_more:hover {
  color: #eb7350;
}
/* 分页 */
.fenye {
  width: 100%;
  margin: 0 auto;
  text-align: center;
}
</style>