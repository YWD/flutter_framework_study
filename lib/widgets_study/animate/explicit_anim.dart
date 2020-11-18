import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web/widgets_study/my_scaffold.dart';

class ExplicitAnim extends StatefulWidget {
  @override
  _ExplicitAnimState createState() => _ExplicitAnimState();
}

class _ExplicitAnimState extends State<ExplicitAnim> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<AlignmentGeometry> alignAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    alignAnimation = AlignmentGeometryTween(begin: Alignment.centerLeft, end: Alignment.centerRight).animate(controller);
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
          AlignTransition(alignment: alignAnimation, child: Container(width: 200, height: 200, color: Colors.cyan,)),
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Container(
                width: 200 * controller.value,
                height: 200 * controller.value,
                color: Colors.purple,
                // child: child,
                child: FlutterLogo(
                  size: 75,
                ),
              );
            },
            child: FlutterLogo(
              size: 75,
            ),
          ),
        ],
      ),
    );
  }
}
