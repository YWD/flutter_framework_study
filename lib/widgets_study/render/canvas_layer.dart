import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

class CanvasLayerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
      child: Column(
        children: [
          Expanded(child: CustomPaint(painter: MyPainter(),),),
          // Container(color: Colors.blue,width: 300, height: 30,child: CustomPaint(painter: MyPainter(),)),
          FlatButton(onPressed: () {
            debugDumpLayerTree();
          }, child: Container(height: 48, color: Colors.yellow,)),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, 24, Paint()..color = Colors.red);
    canvas.saveLayer(Rect.fromLTWH(50, 50, size.width, size.height), Paint()..color = Colors.green);
    canvas.drawCircle(Offset(100, 100), 24, Paint()..color = Colors.blue);
    canvas.restore();
    canvas.drawCircle(Offset(50, 50), 24, Paint()..color = Colors.purple);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
