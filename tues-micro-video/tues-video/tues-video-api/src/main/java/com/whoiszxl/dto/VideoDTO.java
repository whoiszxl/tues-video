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
 * 视频表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Video对象", description="视频表")
public class VideoDTO extends AbstractObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "视频主键ID")
    private Long id;

    @ApiModelProperty(value = "会员ID")
    private Long memberId;

    @ApiModelProperty(value = "会员昵称")
    private String memberNickname;

    @ApiModelProperty(value = "会员头像")
    private String memberAvatar;

    @ApiModelProperty(value = "文字内容")
    private String videoText;

    @ApiModelProperty(value = "视频封面")
    private String videoCover;

    @ApiModelProperty(value = "视频文件地址")
    private String videoUrl;

    @ApiModelProperty(value = "视频秒数")
    private Float videoSeconds;

    @ApiModelProperty(value = "视频宽度")
    private Integer videoWidth;

    @ApiModelProperty(value = "视频高度")
    private Integer videoHeight;

    @ApiModelProperty(value = "浏览数")
    private Long watchCount;

    @ApiModelProperty(value = "点赞数")
    private Long likeCount;

    @ApiModelProperty(value = "评论数")
    private Long commentCount;

    @ApiModelProperty(value = "来自什么渠道")
    private String channel;

    @ApiModelProperty(value = "定位地址")
    private String address;

    @ApiModelProperty(value = "ip地址")
    private String ip;

    @ApiModelProperty(value = "状态(0：无效 1：有效)")
    private Boolean status;

    @ApiModelProperty(value = "创建时间")
    private Date createdAt;

    @ApiModelProperty(value = "更新时间")
    private Date updatedAt;


}
