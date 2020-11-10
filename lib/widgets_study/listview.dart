import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

class ListViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {

  ScrollController ctrl;

  @override
  void initState() {
    super.initState();

    // print('window(${window.physicalSize.width},${window.physicalSize.height})');
    // print('window(${window.physicalSize.width / window.devicePixelRatio},${window.physicalSize.height / window.devicePixelRatio})');

    ctrl = ScrollController();
    // ctrl.addListener(() {
    //   print('ctrl.position.maxScrollExtent:${ctrl.position.maxScrollExtent}');
    //   print('ctrl.position.minScrollExtent:${ctrl.position.minScrollExtent}');
    //   print('controller offset:${ctrl.offset}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: DirectionWidget(child: ListView.builder(itemBuilder: (context, index) {
          // return ListTile(title: Text('list title $index'), trailing: CustomPaint(painter: MyPainter(),),);
          // return ListTile(title: Text('list title $index'), trailing: MyColoredBox(color: Colors.red, child: Container(width: 20, height: 20,),),);
          return MyColoredBox(color: Colors.red, child: Container(width: 20, height: 80,),);
        }, controller: ctrl,)),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Color>('color', color));
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
    print('color offset:$offset');
    print('color size:$size');
    if (size > Size.zero) {
      context.canvas.drawRect(offset & size, Paint()..color = color ..style = PaintingStyle.stroke ..strokeWidth = 2);
    }
    if (child != null) {
      context.paintChild(child, offset);
    }
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print('size:$size');
    canvas.drawCircle(Offset.zero, 12, Paint()..color = Colors.red ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}


