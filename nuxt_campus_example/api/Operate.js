import request from '@/utils/request'

const api_name = `/api/operate`

export default {
    // 删除发表的评论
    deletePin(coid) {
        return request({
            url: `${api_name}/delComment`,
            method: `post`,
            data: coid
        })
    },
    // 删除发布的信息
    deleteContent(cid) {
        return request({
            url: `campus/delContent/`+cid,
            method: `delete`,
        })
    },
    //提交点赞信息
    zanContent(cid) {
        return request({
            url: `campus/zan/` + cid,
            method: `get`,
        })
    },
    // 发布评论
    toComment(toCommentVo) {
        return request({
            url: `campus/toComment`,
            method: `post`,
            data: toCommentVo
        })
    },
    //发布内容
    publishContent(sendContentVo) {
        return request({
            url: `campus/sendContent`,
            method: 'post',
            data: sendContentVo
        })
    },
    //获取自己发的信息
    ownContents(contentSet) {
        return request({
            url: `campus/ownContents`,
            method: 'post',
            data: contentSet
        })
    },
}