package com.whoiszxl.service.impl;

import com.whoiszxl.entity.Topic;
import com.whoiszxl.mapper.TopicMapper;
import com.whoiszxl.service.TopicService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 视频主题表 服务实现类
 * </p>
 *
 * @author whoiszxl
 * @since 2021-09-07
 */
@Service
public class TopicServiceImpl extends ServiceImpl<TopicMapper, Topic> implements TopicService {

}
