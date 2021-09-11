
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whoiszxl/constants/colors.dart';
import 'package:whoiszxl/pages/home/home_page.dart';
import 'package:whoiszxl/pages/live/live_page.dart';
import 'package:whoiszxl/pages/mall/mall_page.dart';
import 'package:whoiszxl/pages/mine/mine_page.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  PageController _controller = PageController(initialPage: 0); // 页面控制器
  Color _defaultColor = MyColors.defaultColor; // 默认颜色
  Color _activeColor = MyColors.mainColor; // 激活态颜色
  int _currentIndex = 0; // 当前索引
  DateTime _lastPressedAt; // 上次点击时间

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 底部导航item，传入图标，文字与下标位置
  BottomNavigationBarItem _bottomItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: _defaultColor),
      activeIcon: Icon(icon, color: _activeColor),
      label: label,
    );
  }

  // 退出app方法
  Future<bool> exitApp() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
      Fluttertoast.showToast(
          msg: "再按一次退出应用",
          backgroundColor: MyColors.mainColor,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 14);
      _lastPressedAt = DateTime.now();
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: exitApp,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            HomePage(),
            LivePage(),
            MallPage(),
            MinePage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(color: _activeColor),
        unselectedLabelStyle: TextStyle(color: _defaultColor),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _bottomItem(Icons.home_outlined, '首页', 0),
          _bottomItem(Icons.live_tv_outlined, '直播', 1),
          _bottomItem(Icons.shopping_cart_outlined, '会员购', 2),
          _bottomItem(Icons.account_circle_outlined, '我的', 3),
        ],
      ),
    );
  }
}