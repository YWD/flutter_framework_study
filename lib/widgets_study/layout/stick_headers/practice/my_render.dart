import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyRender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('size:${window.physicalSize}');
    return SingleChildScrollView(
      child: Column(children: [
        Container(color: Colors.red, height: 1000,),
        LimitedBox(maxHeight: 500,child: MyConstrainedBox(index: 1, constraints: BoxConstraints.expand(),child: Container(color: Colors.green, height: 500,))),
        LimitedBox(maxHeight: 500,child: MyConstrainedBox(index: 2, constraints: BoxConstraints.expand(),child: Container(color: Colors.blue, height: 500,))),
        Builder(builder: (context) {
          print('builder build');
          return Container(color: Colors.yellow, height: 500,);
        },),
      ],),
    );
    // return DirectionWidget(
    //   child: ListView(children: [
    //         Container(color: Colors.red, height: 1000,),
    //         LimitedBox(maxHeight: 500,child: MyConstrainedBox(index: 1, constraints: BoxConstraints.expand(),child: Container(color: Colors.green, height: 500,))),
    //         LimitedBox(maxHeight: 500,child: MyConstrainedBox(index: 2, constraints: BoxConstraints.expand(),child: Container(color: Colors.blue, height: 500,))),
    //   ],),
    // );
  }
}

class MyConstrainedBox extends SingleChildRenderObjectWidget {
  /// Creates a widget that imposes additional constraints on its child.
  ///
  /// The [constraints] argument must not be null.
  MyConstrainedBox({
    Key key,
    @required this.constraints,
    Widget child,  this.index,
  }) : assert(constraints != null),
        assert(constraints.debugAssertIsValid()),
        super(key: key, child: child);

  final int index;
  /// The additional constraints to impose on the child.
  final BoxConstraints constraints;

  @override
  MyRenderConstrainedBox createRenderObject(BuildContext context) {
    var scrollable = Scrollable.of(context);
    return MyRenderConstrainedBox(index,scrollable: scrollable,additionalConstraints: constraints);
  }

  @override
  void updateRenderObject(BuildContext context, RenderConstrainedBox renderObject) {
    renderObject.additionalConstraints = constraints;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BoxConstraints>('constraints', constraints, showName: false));
  }
}

class MyRenderConstrainedBox extends RenderProxyBox {
  /// Creates a render box that constrains its child.
  ///
  /// The [additionalConstraints] argument must not be null and must be valid.
  MyRenderConstrainedBox(this.index, {
    RenderBox child,
    @required BoxConstraints additionalConstraints, ScrollableState scrollable,
  }) : assert(additionalConstraints != null),
        assert(additionalConstraints.debugAssertIsValid()),
        _additionalConstraints = additionalConstraints,
        _scrollableState = scrollable,
        super(child);

  int index;
  ScrollableState _scrollableState;

  /// Additional constraints to apply to [child] during layout.
  BoxConstraints get additionalConstraints => _additionalConstraints;
  BoxConstraints _additionalConstraints;
  set additionalConstraints(BoxConstraints value) {
    assert(value != null);
    assert(value.debugAssertIsValid());
    if (_additionalConstraints == value)
      return;
    _additionalConstraints = value;
    markNeedsLayout();
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    // _scrollableState.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    super.detach();
    // _scrollableState.position.removeListener(markNeedsLayout);
  }

  @override
  void layout(Constraints constraints, {bool parentUsesSize = false}) {
    print('layout invoke');
    super.layout(constraints, parentUsesSize: parentUsesSize);
  }


  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    print('paint invoke :$index');
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (_additionalConstraints.hasBoundedWidth && _additionalConstraints.hasTightWidth)
      return _additionalConstraints.minWidth;
    final double width = super.computeMinIntrinsicWidth(height);
    assert(width.isFinite);
    if (!_additionalConstraints.hasInfiniteWidth)
      return _additionalConstraints.constrainWidth(width);
    return width;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (_additionalConstraints.hasBoundedWidth && _additionalConstraints.hasTightWidth)
      return _additionalConstraints.minWidth;
    final double width = super.computeMaxIntrinsicWidth(height);
    assert(width.isFinite);
    if (!_additionalConstraints.hasInfiniteWidth)
      return _additionalConstraints.constrainWidth(width);
    return width;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (_additionalConstraints.hasBoundedHeight && _additionalConstraints.hasTightHeight)
      return _additionalConstraints.minHeight;
    final double height = super.computeMinIntrinsicHeight(width);
    assert(height.isFinite);
    if (!_additionalConstraints.hasInfiniteHeight)
      return _additionalConstraints.constrainHeight(height);
    return height;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (_additionalConstraints.hasBoundedHeight && _additionalConstraints.hasTightHeight)
      return _additionalConstraints.minHeight;
    final double height = super.computeMaxIntrinsicHeight(width);
    assert(height.isFinite);
    if (!_additionalConstraints.hasInfiniteHeight)
      return _additionalConstraints.constrainHeight(height);
    return height;
  }

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    if (child != null) {
      child.layout(_additionalConstraints.enforce(constraints), parentUsesSize: true);
      size = child.size;
    } else {
      size = _additionalConstraints.enforce(constraints).constrain(Size.zero);
    }

    double offset = localToGlobal(Offset.zero, ancestor: _scrollableState.context.findRenderObject()).dy;
    print('offset $index:$offset');
    print('size $index:$size');
  }

  @override
  void debugPaintSize(PaintingContext context, Offset offset) {
    super.debugPaintSize(context, offset);
    assert(() {
      Paint paint;
      if (child == null || child.size.isEmpty) {
        paint = Paint()
          ..color = const Color(0x90909090);
        context.canvas.drawRect(offset & size, paint);
      }
      return true;
    }());
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BoxConstraints>('additionalConstraints', additionalConstraints));
  }
}