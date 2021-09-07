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
 * 背景音乐表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Bgmusic对象", description="背景音乐表")
public class BgmusicDTO extends AbstractObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "背景音乐主键ID")
    private Long id;

    @ApiModelProperty(value = "音乐名")
    private String musicName;

    @ApiModelProperty(value = "作曲者")
    private String musicComposer;

    @ApiModelProperty(value = "作词者")
    private String musicLyricist;

    @ApiModelProperty(value = "音乐版权")
    private String musicCopyright;

    @ApiModelProperty(value = "状态(0：无效 1：有效)")
    private Boolean status;

    @ApiModelProperty(value = "创建时间")
    private Date createdAt;

    @ApiModelProperty(value = "更新时间")
    private Date updatedAt;


}
