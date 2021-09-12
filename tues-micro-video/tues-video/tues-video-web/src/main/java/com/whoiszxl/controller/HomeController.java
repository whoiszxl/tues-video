package com.whoiszxl.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whoiszxl.bean.PageQuery;
import com.whoiszxl.bean.ResponseResult;
import com.whoiszxl.dto.VideoBannerDTO;
import com.whoiszxl.entity.Video;
import com.whoiszxl.entity.vo.IndexBannerVO;
import com.whoiszxl.entity.vo.VideoBannerVO;
import com.whoiszxl.enums.BannerTypeEnum;
import com.whoiszxl.service.VideoBannerService;
import com.whoiszxl.service.VideoService;
import com.whoiszxl.utils.BeanCopierUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private VideoBannerService videoBannerService;

    @Autowired
    private VideoService videoService;

    @PostMapping("/app/index")
    @ApiOperation(value = "app主页Banner数据")
    public ResponseResult<IndexBannerVO> homeAppIndex() {
        List<VideoBannerDTO> appBanners = videoBannerService.getBannerByType(BannerTypeEnum.APP_BANNER);
        List<VideoBannerDTO> navigationBanners = videoBannerService.getBannerByType(BannerTypeEnum.APP_NAVIGATION);

        List<VideoBannerVO> homeBannerVOS = BeanCopierUtils.copyListProperties(appBanners, VideoBannerVO::new);
        List<VideoBannerVO> navigationBannerVOS = BeanCopierUtils.copyListProperties(navigationBanners, VideoBannerVO::new);

        IndexBannerVO indexBannerVO = new IndexBannerVO();
        indexBannerVO.setBanners(homeBannerVOS);
        indexBannerVO.setNavigations(navigationBannerVOS);
        return ResponseResult.buildSuccess(indexBannerVO);
    }


    @PostMapping("/recommend")
    @ApiOperation(value = "app主页视频推荐")
    public ResponseResult<IPage<Video>> videoRecommend(@RequestBody PageQuery query) {
        //TODO 暂写死
        LambdaQueryWrapper<Video> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Video::getCreatedAt);
        IPage<Video> videoPage = videoService.page(new Page<>(query.getPage(), query.getSize()), queryWrapper);
        return ResponseResult.buildSuccess(videoPage);
    }
}