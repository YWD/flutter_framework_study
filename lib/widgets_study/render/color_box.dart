import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: ColorBoxWidget(),);
  }
}

class ColorBoxWidget extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) => RenderColorBox();
}

class RenderColorBox extends RenderBox {

  // @override
  // void performLayout() {
  //   super.performLayout();
  //   size = Size(100, 100);
  // }

  @override
  bool get sizedByParent => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.drawRect(offset & size, Paint()..color = Colors.green);
    context.canvas.drawCircle(Offset(200, 200), 50, Paint()..color = Colors.red);
  }
}
