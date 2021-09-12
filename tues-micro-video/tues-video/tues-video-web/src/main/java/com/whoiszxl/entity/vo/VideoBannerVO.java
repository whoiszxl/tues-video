package com.whoiszxl.entity.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.whoiszxl.bean.AbstractObject;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 首页轮播表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-07-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="VideoBannerVO对象")
public class VideoBannerVO extends AbstractObject implements Serializable {

    private Integer id;

    @ApiModelProperty(value = "轮播图名称")
    private String name;

    @ApiModelProperty(value = "轮播位置：0->PC首页轮播；1->app首页轮播 2->app导航小组件")
    private Integer type;

    @ApiModelProperty(value = "图片地址")
    private String pic;

    @ApiModelProperty(value = "上下线状态：0->下线；1->上线")
    private Integer status;

    @ApiModelProperty(value = "点击数")
    private Integer clickCount;

    @ApiModelProperty(value = "链接地址")
    private String url;

    @ApiModelProperty(value = "备注")
    private String note;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @ApiModelProperty(value = "创建时间")
    private Date createdAt;

    @ApiModelProperty(value = "更新时间")
    private Date updatedAt;

}
