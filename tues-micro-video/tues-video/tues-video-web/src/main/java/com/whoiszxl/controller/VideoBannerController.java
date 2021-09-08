package com.whoiszxl.controller;


import com.whoiszxl.bean.ResponseResult;
import com.whoiszxl.dto.VideoBannerDTO;
import com.whoiszxl.entity.VideoBanner;
import com.whoiszxl.entity.vo.VideoBannerVO;
import com.whoiszxl.entity.vo.IndexBannerVO;
import com.whoiszxl.enums.BannerTypeEnum;
import com.whoiszxl.service.VideoBannerService;
import com.whoiszxl.utils.BeanCopierUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 首页视频轮播表 前端控制器
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-09
 */
@RestController
@RequestMapping("/video-banner")
public class VideoBannerController {

    @Autowired
    private VideoBannerService videoBannerService;

    @PostMapping("/app/index")
    @ApiOperation(value = "app主页Banner数据")
    public ResponseResult<IndexBannerVO> homeAppIndex() {
        List<VideoBannerDTO> appBanners = videoBannerService.getBannerByType(BannerTypeEnum.APP_BANNER);
        List<VideoBannerDTO> navigationBanners = videoBannerService.getBannerByType(BannerTypeEnum.APP_NAVIGATION);

        List<VideoBannerVO> homeBannerVOS = BeanCopierUtils.copyListProperties(appBanners, VideoBannerVO::new);
        List<VideoBannerVO> navigationBannerVOS = BeanCopierUtils.copyListProperties(navigationBanners, VideoBannerVO::new);

        return ResponseResult.buildSuccess(
                new IndexBannerVO(homeBannerVOS, navigationBannerVOS)
        );
    }

}

