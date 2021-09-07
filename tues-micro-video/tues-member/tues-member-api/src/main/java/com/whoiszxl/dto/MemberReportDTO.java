package com.whoiszxl.dto;

import com.whoiszxl.bean.AbstractObject;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 会员举报表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="MemberReport对象", description="会员举报表")
public class MemberReportDTO extends AbstractObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    private Long id;

    @ApiModelProperty(value = "举报人的用户ID")
    private Long memberId;

    @ApiModelProperty(value = "被举报的用户ID")
    private Long reportMemberId;

    @ApiModelProperty(value = "被举报的视频ID")
    private Long reportVideoId;

    @ApiModelProperty(value = "被举报的评论ID")
    private Long reportCommentId;

    @ApiModelProperty(value = "举报标题")
    private String title;

    @ApiModelProperty(value = "举报内容")
    private String content;

    @ApiModelProperty(value = "创建时间")
    private Date createdAt;

    @ApiModelProperty(value = "更新时间")
    private Date updatedAt;


}
