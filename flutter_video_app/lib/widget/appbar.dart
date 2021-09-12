import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whoiszxl/constants/colors.dart';

///自定义顶部appBar
MyAppBar(String title, String rightTitle, VoidCallback rightButtonClick) {

  return AppBar(
    //title靠左
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    //title行间距
    titleSpacing: 0,

    leading: BackButton(),

    title: Text(
      title,
      style: TextStyle(fontSize: 18),
    ),

    actions: [
      InkWell(
        onTap: rightButtonClick,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          child: Text(
            rightTitle,
            style: TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ],
  );

}