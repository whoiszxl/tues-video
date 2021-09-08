package com.whoiszxl.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.whoiszxl.entity.MemberInfo;

/**
 * <p>
 * 会员详情表 服务类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
public interface MemberInfoService extends IService<MemberInfo> {

    /**
     * 通过会员ID获取会员详细数据
     * @param memberId 会员ID
     * @return 会员详细数据
     */
    MemberInfo getByMemberId(long memberId);

    /**
     * 更新会员详细数据，通过会员ID
     * @param memberInfo 会员详细数据
     * @return
     */
    boolean updateByMemberId(MemberInfo memberInfo);

}
