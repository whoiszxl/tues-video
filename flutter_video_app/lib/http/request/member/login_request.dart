import 'package:whoiszxl/http/request/base_request.dart';

class LoginRequest extends BaseRequest {

  @override
  bool needLogin() {
    return false;
  }

  @override
  RequestMethod requestMethod() {
    return  RequestMethod.POST;
  }

  @override
  String path() {
    return "/member/member/login";
  }
  
}