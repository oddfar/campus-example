package com.oddfar.campus.business.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.business.domain.vo.CommentVo;
import com.oddfar.campus.common.core.BaseMapperX;
import com.oddfar.campus.common.core.LambdaQueryWrapperX;
import com.oddfar.campus.common.domain.PageResult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zhiyuan
 */
@Mapper
public interface CommentMapper extends BaseMapperX<CommentEntity> {

    default PageResult<CommentEntity> selectPage(CommentEntity comment) {

        return selectPage(new LambdaQueryWrapperX<CommentEntity>()
                .likeIfPresent(CommentEntity::getCoContent, comment.getCoContent())
                .eqIfPresent(CommentEntity::getUserId, comment.getUserId())
                .eqIfPresent(CommentEntity::getContentId, comment.getContentId())
        );
    }
    /**
     * 获取信息墙的总评论数量
     *
     * @param contentId
     * @return
     */
    default Long getCommentCount(Long contentId){
        return selectCount(new QueryWrapper<CommentEntity>().eq("content_id", contentId));
    }

    /**
     * 获取一级评论列表
     *
     * @param commentEntity
     * @return
     */
    List<CommentVo> getOneLevel(CommentEntity commentEntity);

    /**
     * 查询一级评论列表的作者的一条子评论列表
     *
     * @param commentIds 评论列表
     * @param userId     作者用户id
     * @return
     */
    List<CommentVo> getOneLevelChildHaveAuthor(@Param("commentIds") List<Long> commentIds, @Param("userId") Long userId);

    /**
     * 获取一级评论的子评论
     *
     * @param commentEntity
     * @return
     */
    List<CommentVo> getOneLevelChild(CommentEntity commentEntity);

    /**
     * 获取一级评论的子评论
     *
     * @param commentId
     * @return
     */
    List<CommentVo> getOneLevelChildList(@Param("commentId") Long commentId, @Param("oneLevelId") Long oneLevelId);

    /**
     * 查询自己发布或回复的评论列表
     *
     * @return
     */
    List<CommentVo> selectOwnComment(@Param("userId") Long userId);

    /**
     * 根据id查询评论信息
     *
     * @param commentId
     * @return
     */
    CommentVo selectCommentVo(@Param("commentId") Long commentId);
}




