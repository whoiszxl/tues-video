package com.whoiszxl.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whoiszxl.bean.AbstractObject;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 会员关系表
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("member_relation")
@ApiModel(value="MemberRelation对象", description="会员关系表")
public class MemberRelation extends AbstractObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

    @ApiModelProperty(value = "from用户ID")
    private Long fromMemberId;

    @ApiModelProperty(value = "to用户ID")
    private Long toMemberId;

    @ApiModelProperty(value = "关系：1 to是from的粉丝， 2 from是to的粉丝， 3 from和to互关")
    private Integer relation;

    @ApiModelProperty(value = "to方昵称")
    private String toNickname;

    @ApiModelProperty(value = "to方简介")
    private String toIntro;

    @ApiModelProperty(value = "创建时间")
    private Date createdAt;

    @ApiModelProperty(value = "更新时间")
    private Date updatedAt;


}
