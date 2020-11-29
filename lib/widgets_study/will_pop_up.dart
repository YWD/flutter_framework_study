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

/// 文章整理
///   Android 篇
///     Android APP 启动过程
///       老王的 Android APP 启动过程分析
///       Android 11 APP 启动源码分析
/// Flutter 篇
/// Dart 篇
/// Java 篇
