import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

class PositionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
      child: Container(color: Colors.green,child: Stack(
        children: [
          Positioned(
            left: 20,
            width: 50,
            child: Container(width: 200, height: 200, color: Colors.red,),),
        ],
      ),),
    );
  }
}
