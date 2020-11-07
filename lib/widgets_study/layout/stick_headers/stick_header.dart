import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StickHeaderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StickHeaderWidget(children: [
            Container(height: 48 * 5.0, color: Colors.green,),
            Container(height: 48, color: Colors.red,),
          ],),
          Container(height: 500, color: Colors.blue,),
          Container(height: 500, color: Colors.yellow,),
        ],
      ),
    );
  }
}

class StickHeaderWidget extends MultiChildRenderObjectWidget {
  StickHeaderWidget({Key key, List<Widget> children}): super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) => RenderStickHeader(Scrollable.of(context));

  @override
  void updateRenderObject(BuildContext context, covariant RenderStickHeader renderObject) {
    renderObject.scrollableState = Scrollable.of(context);
  }
}

class RenderStickHeader extends RenderBox with ContainerRenderObjectMixin<RenderBox, ListBodyParentData>, RenderBoxContainerDefaultsMixin<RenderBox, ListBodyParentData> {
  RenderStickHeader(this.scrollableState);

  ScrollableState scrollableState;

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    scrollableState.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    super.detach();
    scrollableState.position.removeListener(markNeedsLayout);
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! ListBodyParentData) {
      child.parentData = ListBodyParentData();
    }
  }

  @override
  void performLayout() {
    firstChild.layout(constraints, parentUsesSize: true);
    lastChild.layout(constraints, parentUsesSize: true);

    size = Size(firstChild.size.width, firstChild.size.height + lastChild.size.height);

    ListBodyParentData contentParentData = firstChild.parentData;
    contentParentData.offset = Offset(0, lastChild.size.height);

    ListBodyParentData headerParentData = lastChild.parentData;
    print('offset:${getHeaderOffset()}');
    headerParentData.offset = Offset(0, getHeaderOffset());

  }

  getHeaderOffset() {
    double dy = localToGlobal(Offset.zero, ancestor: scrollableState.context.findRenderObject()).dy;
    if (dy < 0 && dy > -firstChild.size.height) {
      return -dy;
    }
    if (dy < -(firstChild.size.height - lastChild.size.height)) {
      dy = firstChild.size.height;
      return dy;
    }
    return 0;
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    print('painting...');
    defaultPaint(context, offset);
  }
}
