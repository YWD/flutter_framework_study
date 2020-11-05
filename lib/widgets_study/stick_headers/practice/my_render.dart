import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyRender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('size:${window.physicalSize}');
    return SingleChildScrollView(
      child: MySingleChildRenderObjectWidget(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}

class MySingleChildRenderObjectWidget extends SingleChildRenderObjectWidget {
  final Widget child;
  MySingleChildRenderObjectWidget({Widget child}):this.child = child, super(child: child);
  @override
  RenderObject createRenderObject(BuildContext context) {
    var scrollable = Scrollable.of(context);
    return MyRenderBox(scrollable);
  }

  @override
  void updateRenderObject(BuildContext context, MyRenderBox renderObject) {
    renderObject
      ..scrollable = Scrollable.of(context);
  }
}

class MyRenderBox extends RenderConstrainedBox {
  ScrollableState _scrollableState;
  MyRenderBox([ScrollableState scrollable]) :_scrollableState = scrollable, super(additionalConstraints: BoxConstraints.tight(Size(window.physicalSize.width, window.physicalSize.height * 2)));

  set scrollable(ScrollableState newValue) {
    assert(newValue != null);
    if (_scrollableState == newValue) {
      markNeedsLayout();
      return;
    }
    final ScrollableState oldValue = _scrollableState;
    _scrollableState = newValue;
    markNeedsLayout();
    if (attached) {
      oldValue.position?.removeListener(markNeedsLayout);
      newValue.position?.addListener(markNeedsLayout);
    }
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _scrollableState.position?.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollableState.position?.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void performLayout() {
    // super.performLayout();
    size = Size(window.physicalSize.width / window.devicePixelRatio, window.physicalSize.height / window.devicePixelRatio);

    double offset = localToGlobal(Offset.zero, ancestor: null).dy;
    print('offset:$offset');
  }
}
