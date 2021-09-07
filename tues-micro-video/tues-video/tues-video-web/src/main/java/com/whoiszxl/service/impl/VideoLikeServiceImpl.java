package com.whoiszxl.service.impl;

import com.whoiszxl.entity.VideoLike;
import com.whoiszxl.mapper.VideoLikeMapper;
import com.whoiszxl.service.VideoLikeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 视频点赞表 服务实现类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Service
public class VideoLikeServiceImpl extends ServiceImpl<VideoLikeMapper, VideoLike> implements VideoLikeService {

}
