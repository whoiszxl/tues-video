import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:whoiszxl/constants/my_key.dart';
import 'package:whoiszxl/http/core/zero_net.dart';
import 'package:whoiszxl/http/request/member/login_request.dart';
import 'package:whoiszxl/http/request/member/member_info_request.dart';
import 'package:whoiszxl/http/request/member/register_request.dart';
import 'package:whoiszxl/http/request/member/register_sms_request.dart';
import 'package:whoiszxl/model/member_detail_model.dart';
import 'package:whoiszxl/utils/log_util.dart';
import 'package:whoiszxl/utils/string_util.dart';

///用户DAO层
class MemberDao {

  ///登录
  static login(String username, String password) async {
    LoginRequest loginRequest = new LoginRequest();
    loginRequest
        .addParam("username", username)
        .addParam("password", password);

    var result = await ZeroNet.getInstance().request(loginRequest);
    print("登录结果：" + result.toString());

    if(result['code'] == 0 && result['data'] != null) {
      String returnToken = result['data'];
      SpUtil.putString(MyKey.MEMBER_TOKEN, returnToken);
    }
    return result;
  }

  ///注册
  static register(String username, String verifyCode, String password, String rePassword) async {
    RegisterRequest registerRequest = new RegisterRequest();
    registerRequest
        .addParam("mobile", username)
        .addParam("code", verifyCode)
        .addParam("password", password)
        .addParam("rePassword", rePassword);

    var result = await ZeroNet.getInstance().request(registerRequest);
    print("注册结果：" + result.toString());

    return result;
  }

  ///通过本地token获取用户信息
  static userInfo() async {
    //从本地获取用户token
    String memberToken = SpUtil.getString(MyKey.MEMBER_TOKEN);
    if(StringUtil.isEmpty(memberToken)) {
      return null;
    }

    //构建请求
    MemberInfoRequest memberInfoRequest = new MemberInfoRequest();
    memberInfoRequest.addHeaderToken(memberToken);

    var result = await ZeroNet.getInstance().request(memberInfoRequest);
    Log.info("获取到用户信息: " + result.toString());
    return MemberDetailModel.fromJson(result['data']);
  }


  ///发送注册短信验证码
  static sendSmsVerifyCode(String mobile) async {
    RegisterSmsRequest registerSmsRequest = new RegisterSmsRequest();
    registerSmsRequest.addParam("mobile", mobile);

    var result = await ZeroNet.getInstance().request(registerSmsRequest);
    print("发送注册短信结果：" + result.toString());

    return result;
  }

  ///获取本地token
  static getLocalToken() {
    return SpUtil.getString(MyKey.MEMBER_TOKEN);
  }
}