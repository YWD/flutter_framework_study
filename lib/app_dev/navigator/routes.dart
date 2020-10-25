import 'package:flutter/material.dart';
//引入文件
//配置路由规则
final routes = {
  '/': (context) => Home(),
  '/page1': (context) => Page1(),
  '/page2': (context) => Page2(),
  '/page3': (context) => Page3(),
};

// 如果你要把路由抽离出去，必须写下面这一堆的代码，不用理解什么意思
Route<dynamic> Function(RouteSettings settings) onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;  // onUnknownRoute will be invoked
};

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
