import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  MyScaffold({this.child, this.onPress, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: child),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_circle_fill),
          onPressed: onPress,
        ),
      ),
    );
  }
}
