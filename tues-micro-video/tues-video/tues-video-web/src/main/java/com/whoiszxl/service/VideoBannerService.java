package com.whoiszxl.service;

import com.whoiszxl.dto.VideoBannerDTO;
import com.whoiszxl.entity.VideoBanner;
import com.baomidou.mybatisplus.extension.service.IService;
import com.whoiszxl.entity.vo.VideoBannerVO;
import com.whoiszxl.enums.BannerTypeEnum;

import java.util.List;

/**
 * <p>
 * 首页视频轮播表 服务类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-09
 */
public interface VideoBannerService extends IService<VideoBanner> {

    /**
     * 通过banner类型获取banner列表
     * @param bannerType banner类型枚举
     * @return
     */
    List<VideoBannerDTO> getBannerByType(BannerTypeEnum bannerType);
}
