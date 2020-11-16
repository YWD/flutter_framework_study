import 'package:flutter/material.dart';

class AnimateDemoE extends StatefulWidget {
  @override
  _AnimateDemoEState createState() => _AnimateDemoEState();
}

class _AnimateDemoEState extends State<AnimateDemoE> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    var animation = IntTween(begin: 0, end: 255).animate(_controller);
    animation.addListener(() {
      print('value:${animation.value}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_circle_fill),
          onPressed: () {
            _controller.forward();
          },
        ),
      ),
    );
  }
}
