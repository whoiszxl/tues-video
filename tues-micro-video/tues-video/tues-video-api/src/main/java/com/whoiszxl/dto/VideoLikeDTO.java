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
 * 视频点赞表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="VideoLike对象", description="视频点赞表")
public class VideoLikeDTO extends AbstractObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "视频ID")
    private Long videoId;

    @ApiModelProperty(value = "会员ID")
    private Long memberId;

    @ApiModelProperty(value = "喜欢状态：0:无操作 1:喜欢 2:不喜欢")
    private Integer likeStatus;

    @ApiModelProperty(value = "操作时间")
    private Date likeTime;


}
