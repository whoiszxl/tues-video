package com.whoiszxl.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whoiszxl.entity.MemberReport;
import com.whoiszxl.mapper.MemberReportMapper;
import com.whoiszxl.service.MemberReportService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 会员举报表 服务实现类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Service
public class MemberReportServiceImpl extends ServiceImpl<MemberReportMapper, MemberReport> implements MemberReportService {

}
