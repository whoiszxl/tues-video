import 'package:flutter/material.dart';

class VideoDetailPage extends StatefulWidget {

  final int videoId;

  const VideoDetailPage({Key key, this.videoId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VideoDetailPageState();
}

class VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "视频详情页" + widget.videoId.toString()
      ),
    );
  }



}