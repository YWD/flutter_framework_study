import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

class LinearTween extends StatefulWidget {
  @override
  _LinearTweenState createState() => _LinearTweenState();
}

class _LinearTweenState extends State<LinearTween> with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    var animate = IntTween(begin: 0, end: 255).animate(controller);
    animate.addListener(() {
      print('value:${animate.value}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(child: Container(child: FloatingActionButton(onPressed: () {
      controller.forward();
    }, child: Icon(Icons.play_circle_fill),),));
  }
}
