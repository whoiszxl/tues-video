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
 * 视频主题表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Topic对象", description="视频主题表")
public class TopicDTO extends AbstractObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主题主键ID")
    private Long id;

    @ApiModelProperty(value = "主题标题")
    private String title;

    @ApiModelProperty(value = "阅读数")
    private Integer watch;

    @ApiModelProperty(value = "讨论数")
    private Long count;

    @ApiModelProperty(value = "状态(0：无效 1：有效)")
    private Integer status;

    @ApiModelProperty(value = "创建时间")
    private Date createdAt;

    @ApiModelProperty(value = "更新时间")
    private Date updatedAt;


}
