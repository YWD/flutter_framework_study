import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web/widgets_study/my_scaffold.dart';

class ImplicitAnim extends StatefulWidget {
  @override
  _ImplicitAnimState createState() => _ImplicitAnimState();
}

class _ImplicitAnimState extends State<ImplicitAnim> {
  double width;
  double height;
  Alignment alignment;
  Color color;

  @override
  void initState() {
    super.initState();

    _changeProperty();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      onPress: () {
        setState(() {
          // stateChanged = !stateChanged;
          // _changeProperty();
          _state = !stateChanged;
        });
      },
      child: Container(
        // width: 200,
        // height: 200,
        // color: Colors.red,
        width: window.physicalSize.height / window.devicePixelRatio,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: width,
              height: height,
              alignment: alignment,
              color: color,
              duration: Duration(seconds: 3),
              child: FlutterLogo(
                size: 75,
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0, end: pi * 2),
              duration: Duration(seconds: 3),
              curve: Curves.linear,
              builder: (context, value, child) {
                // return Opacity(
                //   opacity: value / 255,
                //   child: child,
                // );
                return Transform.rotate(angle: value, child: child,);
              },
              child: Container(
                color: Colors.yellow,
                child: FlutterLogo(
                  size: 75,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool stateChanged = true;

  set _state(bool value) {
    stateChanged = value;
    _changeProperty();
  }

  _changeProperty() {
    if (stateChanged) {
      width = 100;
      height = 200;
      color = Colors.red;
    } else {
      width = 200;
      height = 100;
      color = Colors.blue;
    }
  }
}
