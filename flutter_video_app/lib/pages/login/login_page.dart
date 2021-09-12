import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:whoiszxl/constants/colors.dart';
import 'package:whoiszxl/constants/my_key.dart';
import 'package:whoiszxl/dao/member_dao.dart';
import 'package:whoiszxl/http/core/zero_error.dart';
import 'package:whoiszxl/pages/navigator/bottom_navigator.dart';
import 'package:whoiszxl/pages/register/register_page.dart';
import 'package:whoiszxl/utils/navigator_util.dart';
import 'package:whoiszxl/utils/string_util.dart';
import 'package:whoiszxl/utils/toast.dart';
import 'package:whoiszxl/utils/validate_util.dart';
import 'package:whoiszxl/widget/appbar.dart';
import 'package:whoiszxl/widget/normal_button.dart';
import 'package:whoiszxl/widget/normal_input.dart';

///登录页面
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  bool protect = false;
  bool loginEnable = false;
  String username;
  String password;

  @override
  void initState() {
    var token = SpUtil.getString(MyKey.MEMBER_TOKEN);
    if(token != null) {
      showToast(token);
    }else {
      showToast("木有登录");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("", "", () {
        NavigatorUtil.push(context, RegisterPage());
      }),
      body: Column(
        children: <Widget>[
          //LOGO
          new Container(
            padding: EdgeInsets.only(top: 70, bottom: 10),
            child: Text(
              'tues-video',
              style: TextStyle(
                color: MyColors.mainColor,
                fontSize: 30
              ),
            ),
          ),


          NormalInput(
            '用户名',
            '请输入用户名或手机号',
            onChanged: (text) {
              username = text;
              checkInput();
            },
          ),
          NormalInput(
            '密码',
            '请输入密码',
            obscureText: true,
            onChanged: (text) {
              password = text;
              checkInput();
            },

            focusChanged: (focus) {
              this.setState(() {
                protect = focus;
              });
            },
          ),

          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: LoginButton(
              '登录',
              enable: loginEnable,
              onPressed: send,
            ),
          ),

          new Container(
            margin: EdgeInsets.only(top: 30.0),
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  child:  Text(
                    '注册账号',
                    style: TextStyle( fontSize: 13.0, color: Color.fromARGB(255, 53, 53, 53)
                    ),
                  ),

                ),

                Text(
                  '忘记密码？',
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Color.fromARGB(255, 53, 53, 53)
                  ),
                ),
              ],
            ) ,
          ),



        ],
      ),
    );
  }

  //校验输入参数
  void checkInput() {
    setState(() {
      loginEnable = (StringUtil.isNotEmpty(username) && StringUtil.isNotEmpty(password)) ;
    });
  }

  //发送请求
  void send() async {
    try{
      var result = await MemberDao.login(username, password);
      if(verifyResult(result)) {
        showToast("登录成功");
        NavigatorUtil.push(context, BottomNavigator());
      }else {
        showErrorToast(result['message']);
      }
    }on NeedAuth catch(e) {
      showErrorToast(e.message);
    }on ZeroNetError catch(e) {
      showErrorToast(e.message);
    }
  }

}