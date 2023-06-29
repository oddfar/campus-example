package com.oddfar.campus.business.controller.web;

import cn.hutool.core.bean.BeanUtil;
import com.oddfar.campus.business.domain.entity.CommentEntity;
import com.oddfar.campus.business.domain.vo.CommentVo;
import com.oddfar.campus.business.domain.vo.ToCommentVo;
import com.oddfar.campus.business.service.CommentService;
import com.oddfar.campus.common.annotation.Anonymous;
import com.oddfar.campus.common.annotation.ApiResource;
import com.oddfar.campus.common.core.page.PageUtils;
import com.oddfar.campus.common.domain.PageResult;
import com.oddfar.campus.common.domain.R;
import com.oddfar.campus.common.enums.ResBizTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/campus")
@ApiResource(name = "评论api", appCode = "campus", resBizType = ResBizTypeEnum.BUSINESS)
public class CommentInfoController {
    @Autowired
    private CommentService commentService;


    /**
     * 查询一级评论
     */
    @Anonymous
    @GetMapping(value = "/getOneLevelComment", name = "查询一级评论")
    public R getOneLevelComment(CommentEntity commentEntity) {
        PageResult<CommentVo> commentVos = commentService.selectOneLevel(commentEntity);
        R r = new R();
        r.put(commentVos);
        r.put("allTotal", commentService.selectCommentCount(commentEntity.getContentId()));
        return r;
    }

    /**
     * 分页查询一级评论的子评论
     */
    @Anonymous
    @GetMapping(value = "/getCommentChildren", name = "分页查询一级评论的子评论")
    public R getCommentChildren(CommentEntity commentEntity) {
        PageResult<CommentVo> commentVos = commentService.selectOneLevelChild(commentEntity);
        return R.ok().put(commentVos);
    }

    /**
     * 查询一级评论的子评论
     */
    @Anonymous
    @GetMapping(value = "/getCommentChildrenList", name = "查询一级评论的子评论")
    public R getCommentChildrenList(Long commentId) {
        List<CommentVo> commentVos = commentService.selectOneLevelChildList(commentId);
        return R.ok(commentVos);
    }


    /**
     * 分页查询自己发布或回复的评论列表
     */
    @PreAuthorize("@ss.resourceAuth()")
    @GetMapping(value = "getOwnComment", name = "分页查询自己发布或回复的评论列表")
    public R getOwnCommentList() {
        PageUtils.startPage(5);
        List<CommentVo> commentVos = commentService.selectOwnComment();
        //封装分页数据
        PageResult pageResult = PageUtils.getPageResult(commentVos);
        return R.ok().put(pageResult);
    }

    /**
     * 添加评论
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping(value = "/toComment", name = "添加评论")
    public R toComment(@RequestBody @Validated ToCommentVo toCommentVo) {
        CommentEntity commentEntity = new CommentEntity();
        BeanUtil.copyProperties(toCommentVo, commentEntity);

        return R.ok(commentService.insertComment(commentEntity));
    }

    /**
     * 查询评论详细信息
     */
    @Anonymous()
    @GetMapping(value = "/getComment", name = "添加评论")
    public R getComment(Long commentId) {

        return R.ok(commentService.selectCommentVo(commentId));
    }


    /**
     * 删除自己的评论
     */
    @PreAuthorize("@ss.resourceAuth()")
    @PostMapping(value = "/delOwnComment", name = "删除自己的评论")
    public R delOwnComment(Long commentId) {

        return R.ok(commentService.delOwnComment(commentId));
    }
}
