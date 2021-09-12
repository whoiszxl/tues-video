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
 * 视频评论表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("video_comment")
@ApiModel(value="VideoComment对象", description="视频评论表")
public class VideoComment extends AbstractObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "评论主键ID")
    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

    @ApiModelProperty(value = "视频ID")
    private Long videoId;

    @ApiModelProperty(value = "会员ID")
    private Long memberId;

    @ApiModelProperty(value = "会员昵称")
    private String memberNickname;

    @ApiModelProperty(value = "会员头像")
    private String memberAvatar;

    @ApiModelProperty(value = "评论内容")
    private String commentText;

    @ApiModelProperty(value = "评论图片")
    private String commentImgs;

    @ApiModelProperty(value = "@了谁，下划线分割")
    private String at;

    @ApiModelProperty(value = "点赞数")
    private Long like;

    @ApiModelProperty(value = "评论父ID，为0则是主评论")
    private Long parentId;

    @ApiModelProperty(value = "状态(0：无效 1：有效)")
    private Integer status;

    @ApiModelProperty(value = "创建时间")
    private Date createdAt;

    @ApiModelProperty(value = "更新时间")
    private Date updatedAt;


}
