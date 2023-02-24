import request from '@/utils/request'

const api_name = `/tourist`

export default {
    //用户通过cid查询的数据
    getUserByCids(cid) {
        return request({
            url: `${api_name}/content/` + cid,
            method: `get`,
        });
    },
    // 获取评论
    getpinlun(cid) {
        return request({
            url: `${api_name}/getComment/` + cid,
            method: `get`,
        })
    },
    //获取所有分类
    getCategoryList() {
        return request({
            url: `/campus/categoryList`,
            method: `get`,
        })
    },
    //获取消息盒子内容集合
    getContent(contentVo) {
        return request({
            url: `/campus/contentList`,
            method: `get`,
            params: contentVo
        })
    },
    //获取消息盒子内容集合
    getContentById(id) {
        return request({
            url: `/campus/getContent`,
            method: `get`,
            params: { id }
        })
    },
    //获取一级评论
    getOneLevelComment(CommentEntity) {
        return request({
            url: `/campus/getOneLevelComment`,
            method: `get`,
            params: CommentEntity
        })
    },
    //获取子评论
    getCommentChildren(CommentEntity) {
        return request({
            url: `/campus/getCommentChildren`,
            method: `get`,
            params: CommentEntity
        })
    },
    //查询简单热门信息墙内容列表
    getSimpleHotContent() {
        return request({
            url: `/campus/simpleHotContent`,
            method: `get`
        })
    },
    //游客通过cid查询的数据
    getUserCid(cid) {
        return request({
            url: `${api_name}/contents`,
            method: `post`,
            data: cid
        });
    },
    //判断 邮箱或昵称 是否存在
    isExist(loginVo) {
        return request({
            url: `${api_name}/isExist`,
            method: `post`,
            data: loginVo
        });
    }
}