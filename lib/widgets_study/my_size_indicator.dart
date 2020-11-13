import 'dart:math';

import 'package:flutter/material.dart';

class SizeIndicator extends StatelessWidget {
  final double length;
  final double width;
  final double strokeWidth;
  final Axis direction;
  final Color color;
  final String explain;

  SizeIndicator({
    @required this.length,
    @required this.direction,
    this.width = 24.0,
    this.explain = '',
    this.strokeWidth = 2.0,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: direction == Axis.horizontal ? length : width,
      height: direction == Axis.horizontal ? width : length,
      child: CustomPaint(
        size: Size(direction == Axis.horizontal ? length : width, direction == Axis.horizontal ? width : length),
        painter: SizeIndicatorPainter(explain: explain.isNotEmpty ? '$explain ': explain, color: color),
      ),
    );
  }
}

class SizeIndicatorPainter extends CustomPainter {
  String explain;
  Color color;
  SizeIndicatorPainter({this.explain, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    bool isHorizontal = size.width > size.height;
    Paint paint = Paint()..color = color ..strokeWidth = 2;
    TextPainter textPainter = TextPainter()..text = TextSpan(text: '$explain${max(size.width, size.height)}', style: TextStyle(color: color))
      ..textDirection = TextDirection.ltr;
    textPainter.layout();
    double textWidth = textPainter.width;
    double textHeight = textPainter.height;

    if (isHorizontal) {
      canvas.drawLine(Offset(4, 4), Offset(4, 20), paint);
      canvas.drawLine(Offset(size.width - 4, 4), Offset(size.width - 4, 20), paint);
      canvas.drawLine(Offset(6, 12), Offset(size.width / 2 - textWidth / 2 - 4, 12), paint);
      canvas.drawLine(Offset(size.width / 2 + textWidth / 2 + 4, 12), Offset(size.width - 6, 12), paint);
      textPainter.paint(canvas, Offset(size.width / 2 - textWidth / 2, 12 - textHeight / 2));
    } else {
      canvas.drawLine(Offset(4, 4), Offset(20, 4), paint);
      canvas.drawLine(Offset(4, size.height - 4), Offset(20, size.height - 4), paint);
      canvas.drawLine(Offset(12, 6), Offset(12, size.height / 2 - textWidth / 2 - 4), paint);
      canvas.drawLine(Offset(12, size.height / 2 + textWidth / 2 + 4), Offset(12, size.height - 6), paint);
      canvas.save();
      canvas.translate(size.width / 2, size.height / 2);
      canvas.rotate(pi / 2);
      textPainter.paint(canvas, Offset(-textWidth / 2, -textHeight / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
