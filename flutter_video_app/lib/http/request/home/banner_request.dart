import 'package:whoiszxl/http/request/base_request.dart';

///banner请求类
class BannerRequest extends BaseRequest {

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "/video/home/app/index";
  }

  @override
  RequestMethod requestMethod() {
    return RequestMethod.POST;
  }
}