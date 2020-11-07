import 'dart:math';

import 'package:flutter/material.dart';

class MyPaintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width:300, color: Colors.blueGrey, height:300,child: CustomPaint(painter: MyPainter(),),);
  }
}

final double radius = 150;
Paint circlePaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 15
  ..color = Colors.yellow;

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(157.5, 150), radius, circlePaint);
    canvas.save();
    canvas.translate(150, 150);
    // canvas.drawLine(Offset.zero, Offset(20, 20), Paint()..color = Colors.red ..strokeWidth = 5);
    canvas.rotate(pi / 2);
    canvas.drawLine(Offset.zero, Offset(0, 20), Paint()..color = Colors.red ..strokeWidth = 5);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}
