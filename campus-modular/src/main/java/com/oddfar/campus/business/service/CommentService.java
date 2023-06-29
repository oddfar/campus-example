package com.oddfar.campus.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.business.domain.vo.CommentVo;
import com.oddfar.campus.common.domain.PageResult;

import java.util.List;


public interface CommentService extends IService<CommentEntity> {

    /**
     * 查询分页
     *
     * @param comment 评论
     * @return
     */
    PageResult<CommentEntity> page(CommentEntity comment);

    /**
     * 分页查询一级评论列表
     *
     * @param comment
     * @return
     */
    PageResult<CommentVo> selectOneLevel(CommentEntity comment);

    /**
     * 查询一级评论子评论
     *
     * @param comment
     * @return
     */
    PageResult<CommentVo> selectOneLevelChild(CommentEntity comment);

    /**
     * 查询一级评论子评论列表
     *
     * @param commentId 大于此评论id的评论列表
     * @return 返回5个评论
     */
    List<CommentVo> selectOneLevelChildList(Long commentId);

    /**
     * 根据id查询评论
     *
     * @param commentId 评论id
     * @return
     */
    CommentVo selectCommentVo(Long commentId);

    /**
     * 查询自己发布或回复的评论列表
     *
     * @return
     */
    List<CommentVo> selectOwnComment();

    /**
     * 获取信息墙的总评论数量
     *
     * @param contentId
     * @return
     */
    Long selectCommentCount(Long contentId);

    /**
     * 新增评论
     *
     * @param comment 评论
     * @return 结果
     */
    Long insertComment(CommentEntity comment);

    /**
     * 修改评论
     *
     * @param comment 评论
     * @return 结果
     */
    int updateComment(CommentEntity comment);

    /**
     * 删除自己的评论
     *
     * @param commentId 评论id
     * @return 结果
     */
    int delOwnComment(Long commentId);

}
