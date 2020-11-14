import 'dart:math';

import 'package:flutter/material.dart';

class SizeIndicator extends StatelessWidget {
  final double length;
  final double height = 16;
  final double strokeWidth;
  final Axis direction;
  final Color color;
  final String explain;

  SizeIndicator({
    @required this.length,
    @required this.direction,
    this.explain = '',
    this.strokeWidth = 2.0,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(direction == Axis.horizontal ? length : height, direction == Axis.horizontal ? height : length),
      painter: SizeIndicatorPainter(axis: direction,explain: explain.isNotEmpty ? '$explain ': explain, color: color),
      // child: Container(
      //   width: direction == Axis.horizontal ? length : height,
      //   height: direction == Axis.horizontal ? height : length,
      // ),
    );
  }
}

/// despite orientation, we draw horizontally, then rotated if need.
class SizeIndicatorPainter extends CustomPainter {
  String explain;
  Color color;
  Axis axis;
  double strokeWidth = 2;
  double textMargin = 4;
  double lineMargin = 4;
  SizeIndicatorPainter({this.axis, this.explain, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    bool isHorizontal = axis == Axis.horizontal;
    double width = isHorizontal ? size.width : size.height;
    double height = isHorizontal ? size.height : size.width;

    Paint paint = Paint()..color = color ..strokeWidth = strokeWidth;
    TextPainter textPainter = TextPainter()..text = TextSpan(text: '$explain$width', style: TextStyle(color: color))
      ..textDirection = TextDirection.ltr;
    textPainter.layout();
    double textWidth = textPainter.width;
    double textHeight = textPainter.height;

    bool includeText = width > textWidth + 2 * textMargin;
    bool needDrawLine = width > textWidth + 2 * textMargin + 2 * lineMargin;

    if (!isHorizontal) {
      canvas.rotate(pi / 2);
      canvas.translate(0, -height);
    }
    // draw divider
    canvas.drawLine(Offset(0, 0), Offset(0, height), paint);
    canvas.drawLine(Offset(width, 0), Offset(width, height), paint);
    // draw text
    if (includeText)
      textPainter.paint(canvas, Offset(width / 2 - textWidth / 2, height / 2 - textHeight / 2));
    else
      textPainter.paint(canvas, Offset(width / 2 - textWidth / 2, height));
    // draw line if there's space
    if (needDrawLine) {
      canvas.drawLine(Offset(lineMargin, height / 2), Offset(width / 2 - textWidth / 2 - textMargin, height / 2), paint);
      canvas.drawLine(Offset(width / 2 + textWidth / 2 + textMargin, height / 2), Offset(width - lineMargin, height / 2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
