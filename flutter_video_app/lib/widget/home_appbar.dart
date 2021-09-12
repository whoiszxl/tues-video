import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whoiszxl/pages/login/login_page.dart';
import 'package:whoiszxl/utils/navigator_util.dart';
import 'package:whoiszxl/utils/toast.dart';

///主页appbar
homeAppBar(BuildContext context) {

  return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              NavigatorUtil.push(context, LoginPage());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image(
                height: 26,
                width: 26,
                image: AssetImage('images/avatar.png'),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    showToast("點擊搜索了");
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 32,
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.search, color: Colors.grey),
                      decoration: BoxDecoration(color: Colors.grey[100]),
                    ),
                  ),
                ),
              )),
          Icon(
            Icons.explore_outlined,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Icon(
              Icons.mail_outline,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );


}