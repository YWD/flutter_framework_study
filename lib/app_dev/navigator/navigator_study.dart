import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [_onUnknownRoute]
// 'Could not find a generator for route $settings in the $runtimeType.\n'
// 'Make sure your root app widget has provided a way to generate \n'
// 'this route.\n'
// 'Generators for routes are searched for in the following order:\n'
// ' 1. For the "/" route, the "home" property, if non-null, is used.\n'
// ' 2. Otherwise, the "routes" table is used, if it has an entry for '
// 'the route.\n'
// ' 3. Otherwise, onGenerateRoute is called. It should return a '
// 'non-null value for any valid route not handled by "home" and "routes".\n'
// ' 4. Finally if all else fails onUnknownRoute is called.\n'
// 'Unfortunately, onUnknownRoute was not set.'
var navigatorStudyApp = MaterialApp(
  // home: Builder(builder: (context) {
  //   return Center(child: FlatButton(child: Text('material app home'), onPressed: () {
  //     Navigator.of(context).pushNamed('non-/');
  //   },),);
  // },),
  theme: ThemeData.dark(),
  initialRoute: 'non-/',  //instead of default '/', will be interpreted by onGenerateInitialRoutes
  routes: {
    'non-/': (context) {
      // Navigator.of(context, rootNavigator: true); // rootNavigator: there may nested navigator find the 'root' one
      return GestureDetector(
        onTapUp: (details) {
          Navigator.of(context).pushNamed('text');
        }, child: Text('route /'));
    },
  },
  // onGenerateInitialRoutes: (String initialRouteName) {  /// default implement by Navigator.defaultGenerateInitialRoutes
  //   return [
  //     MaterialPageRoute(builder: (context) {
  //       return Center(child: Text('onGenerateInitialRoutes'),);
  //     }),
  //   ];
  // },
  /// pageRouteBuilder 默认处理路由
  onGenerateRoute: (settings) {
    if (settings.name == 'test')
      return CupertinoPageRoute(builder: (context) {
        return Text('CupertinoPageRoute');
      });
    return null;
  },
  onUnknownRoute: (settings) {  /// default 'RouteSettings("/", null)' generated by Navigator.defaultGenerateInitialRoutes
    return MaterialPageRoute(builder: (context) {
      print('pages:${Navigator.of(context).widget.pages}');
      return Container(child: GestureDetector(onTapUp: (details) {
        print('pages:${Navigator.of(context).widget.pages}');
        Navigator.of(context).pop();
      },child: Text('onUnknownRoute')),);
    });
  },
  navigatorObservers: [
    AnonymousObserver(),
  ],
);

class AnonymousObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
  }
}