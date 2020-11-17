import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web/widgets_study/my_scaffold.dart';

class ExplicitAnim extends StatefulWidget {
  @override
  _ExplicitAnimState createState() => _ExplicitAnimState();
}

class _ExplicitAnimState extends State<ExplicitAnim> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      onPress: () {
        if (controller.status == AnimationStatus.completed) {
          controller.reset();
        }
        controller.forward();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotationTransition(
            turns: controller,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ],
      ),
    );
  }
}
