package com.whoiszxl.service.impl;

import com.whoiszxl.entity.Video;
import com.whoiszxl.mapper.VideoMapper;
import com.whoiszxl.service.VideoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 视频表 服务实现类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Service
public class VideoServiceImpl extends ServiceImpl<VideoMapper, Video> implements VideoService {

}
