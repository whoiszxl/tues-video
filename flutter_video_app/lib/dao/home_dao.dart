import 'package:whoiszxl/http/core/zero_net.dart';
import 'package:whoiszxl/http/request/home/banner_request.dart';
import 'package:whoiszxl/http/request/home/recommend_request.dart';
import 'package:whoiszxl/model/index_banner_model.dart';
import 'package:whoiszxl/model/index_recommend_model.dart';
import 'package:whoiszxl/utils/log_util.dart';

///主页dao数据访问层
class HomeDao {

  ///获取首页banner与nav导航小组件
  static Future getIndexBanner() async {
    BannerRequest bannerRequest = new BannerRequest();

    var result = await ZeroNet.getInstance().request(bannerRequest);
    Log.debug("banner list" + result['data'].toString());
    return IndexBannerModel.fromJson(result['data']);
  }

  ///获取首页视频推荐
  static Future getRecommendList(int pageNumber, int pageSize) async {
    RecommendRequest recommendRequest = new RecommendRequest();

    var result = await ZeroNet.getInstance().request(recommendRequest);
    Log.debug("recommend list" + result['data'].toString());
    print(result['data'].toString());

    return IndexRecommendModel.fromJson(result['data']);
  }

}