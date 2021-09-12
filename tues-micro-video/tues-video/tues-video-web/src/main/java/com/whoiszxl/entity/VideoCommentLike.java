package com.whoiszxl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableName;
import com.whoiszxl.bean.AbstractObject;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 评论点赞表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("video_comment_like")
@ApiModel(value="VideoCommentLike对象", description="评论点赞表")
public class VideoCommentLike extends AbstractObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "评论ID")
    private Long commentId;

    @ApiModelProperty(value = "会员ID")
    private Long memberId;

    @ApiModelProperty(value = "喜欢状态：0:无操作 1:喜欢 2:不喜欢")
    private Integer likeStatus;

    @ApiModelProperty(value = "操作时间")
    private Date likeTime;


}
