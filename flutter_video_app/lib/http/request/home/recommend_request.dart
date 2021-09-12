import 'package:whoiszxl/http/request/base_request.dart';

///banner请求类
class RecommendRequest extends BaseRequest {

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "/video/home/recommend";
  }

  @override
  RequestMethod requestMethod() {
    return RequestMethod.POST;
  }
}