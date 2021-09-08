package com.whoiszxl.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.whoiszxl.dto.VideoBannerDTO;
import com.whoiszxl.entity.VideoBanner;
import com.whoiszxl.entity.vo.VideoBannerVO;
import com.whoiszxl.enums.BannerTypeEnum;
import com.whoiszxl.enums.StatusEnum;
import com.whoiszxl.mapper.VideoBannerMapper;
import com.whoiszxl.mapper.VideoCommentLikeMapper;
import com.whoiszxl.service.VideoBannerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whoiszxl.utils.BeanCopierUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 首页视频轮播表 服务实现类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-09
 */
@Service
public class VideoBannerServiceImpl extends ServiceImpl<VideoBannerMapper, VideoBanner> implements VideoBannerService {

    @Autowired
    private VideoBannerMapper videoBannerMapper;

    @Override
    public List<VideoBannerDTO> getBannerByType(BannerTypeEnum bannerType) {
        LambdaQueryWrapper<VideoBanner> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(VideoBanner::getType, bannerType.getCode());
        queryWrapper.eq(VideoBanner::getStatus, StatusEnum.OPEN.getCode());
        queryWrapper.orderByDesc(VideoBanner::getSort);
        List<VideoBanner> homeBannerList = this.list(queryWrapper);
        return BeanCopierUtils.copyListProperties(homeBannerList, VideoBannerDTO::new);
    }
}
