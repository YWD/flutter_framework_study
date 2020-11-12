import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SingleChildScrollV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            width: 200,
            height: 200,
            child: SingleChildScrollView(
              child: Container(
                width: 200,
                height: 600,
                child: Column(
                  children: [
                    MyColoredBox(color: Colors.red, child: Container(width: 200, height: 100,),),
                    MyColoredBox(color: Colors.green, child: Container(width: 200, height: 100,),),
                    MyColoredBox(color: Colors.blue, child: Container(width: 200, height: 100,),),
                    MyColoredBox(color: Colors.yellow, child: Container(width: 200, height: 100,),),
                    MyColoredBox(color: Colors.purple, child: Container(width: 200, height: 100,),),
                    MyColoredBox(color: Colors.orange, child: Container(width: 200, height: 100,),),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

/// A widget that paints its area with a specified [Color] and then draws its
/// child on top of that color.
class MyColoredBox extends SingleChildRenderObjectWidget {
  /// Creates a widget that paints its area with the specified [Color].
  ///
  /// The [color] parameter must not be null.
  const MyColoredBox({@required this.color, Widget child, Key key})
      : assert(color != null),
        super(key: key, child: child);

  /// The color to paint the background area with.
  final Color color;

  @override
  _MyRenderColoredBox createRenderObject(BuildContext context) {
    return _MyRenderColoredBox(color: color);
  }

  @override
  void updateRenderObject(BuildContext context, _MyRenderColoredBox renderObject) {
    renderObject.color = color;
  }
}

class _MyRenderColoredBox extends RenderProxyBoxWithHitTestBehavior {
  _MyRenderColoredBox({@required Color color})
      : _color = color,
        super(behavior: HitTestBehavior.opaque);

  /// The fill color for this render object.
  ///
  /// This parameter must not be null.
  Color get color => _color;
  Color _color;

  set color(Color value) {
    assert(value != null);
    if (value == _color) {
      return;
    }
    _color = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (size > Size.zero) {
      context.canvas.drawRect(
          offset & size,
          Paint()
            ..color = color
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2);
    }
    if (child != null) {
      context.paintChild(child, offset);
    }
  }
}
