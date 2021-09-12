
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whoiszxl/model/index_recommend_model.dart';
import 'package:whoiszxl/pages/video_detail/video_detail_page.dart';
import 'package:whoiszxl/utils/format_util.dart';
import 'package:whoiszxl/utils/navigator_util.dart';
import 'package:whoiszxl/utils/view_util.dart';

class VideoCard extends StatelessWidget {

  final Records recommend;

  const VideoCard({Key key, this.recommend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorUtil.push(context, VideoDetailPage(videoId: recommend.id));
      },

      child: SizedBox(
        height: 180,
        child: Card(
          margin: EdgeInsets.only(left: 4, right: 4, bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_itemImage(context), _infoText()],
            ),
          ),
        ),
      )
    );
  }


  _itemImage(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        cachedImage(recommend.videoCover, width: size.width / 2 - 10, height: 120),
        Positioned(
            left: 0, right: 0, bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 3, top: 5),
              decoration: BoxDecoration(
                  // cover 下方渐变效果
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black38, Colors.transparent])),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconText(Icons.ondemand_video, recommend.watchCount),
                  _iconText(Icons.favorite_border, recommend.likeCount),
                  _iconText(null, recommend.videoSeconds),
                ],
              ),
            ))
      ],
    );
  }

  _iconText(IconData iconData, int count) {
    String views = "";
    if (iconData != null) {
      views = FormatUtil.countFormat(count);
    } else {
      views = FormatUtil.durationTransform(recommend.videoSeconds);
    }
    return Row(
      children: [
        if (iconData != null) Icon(iconData, color: Colors.white, size: 12),
        Padding(
            padding: EdgeInsets.only(left: 3),
            child: Text(views,
                style: TextStyle(color: Colors.white, fontSize: 10)))
      ],
    );
  }


  _infoText() {
    return Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //视频名称
              Text(
                recommend.videoText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),

              //作者
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [

                      //作者头像
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: cachedImage(recommend.memberAvatar, height: 20, width: 20)),

                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          recommend.memberNickname,
                          style: TextStyle(fontSize: 11, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),

                  //菜单按钮
                  Icon(
                    Icons.more_vert_sharp,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              )

            ],
          ),
        ));
  }
}