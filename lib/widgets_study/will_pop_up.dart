import 'package:flutter/material.dart';
import 'package:flutter_web/widgets_study/my_scaffold.dart';

class PopDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: WillPopScope(child: Container(color: Colors.yellow,), onWillPop: () {
      print('onWillPop');
      return Future.value(false);
    },),);
  }
}
