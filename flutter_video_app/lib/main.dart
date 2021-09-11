import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whoiszxl/constants/colors.dart';
import 'package:whoiszxl/pages/navigator/bottom_navigator.dart';
import 'package:whoiszxl/utils/color_util.dart';

///主函数入口
void main() async {
  //初始化SP工具类
  await SpUtil.getInstance();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    );
    SystemChrome.setSystemUIOverlayStyle(style);


    return MaterialApp(
      title: '周二视频',
      theme: ThemeData(
        primarySwatch: ColorUtil.createMaterialColor(MyColors.mainColor),
      ),
      home: BottomNavigator(),
    );
  }

}