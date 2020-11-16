import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';
import 'package:flutter_web/widgets_study/listview.dart';

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
      child: Container(
        color: Colors.grey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 200,
                    color: Colors.red,
                  ),
                  Container(
                    width: 50,
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 50,
                    height: 150,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.yellow,
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              width: 150,
              child: CustomPaint(
                painter: MyPainter(),
              ),
            ),
            Container(
              width: 150,
              height: 150,
              child: Container(
                width: 300,
                height: 300,
                child: MyColoredBox(
                  color: Colors.cyan,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // print('size:$size');
    canvas.drawLine(Offset.zero, Offset(0, -100), Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
