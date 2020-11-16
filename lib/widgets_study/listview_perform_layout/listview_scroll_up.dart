import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

import '../my_size_indicator.dart';

class ListViewScrollUpAnimate extends StatefulWidget {
  @override
  _ListViewScrollUpAnimateState createState() => _ListViewScrollUpAnimateState();
}

class _ListViewScrollUpAnimateState extends State<ListViewScrollUpAnimate> with SingleTickerProviderStateMixin {
  static const double localScreenWidth = 240;
  static const double localScreenHeight = 280;
  static const double cacheHeight = 140;
  static const double itemHeight = 110;
  static const double itemWidth = 220;
  static const double sizeIndicatorHeight = 16;
  static const double topMargin = 50;
  static const double cacheScreenTop = itemHeight + topMargin;
  static const double cacheScreenBottom = localScreenHeight + 2 * cacheHeight + itemHeight + topMargin;
  static const double listViewContentAnchor = cacheHeight + itemHeight + topMargin;
  double screenHeight = window.physicalSize.height / window.devicePixelRatio;
  double screenWidth = window.physicalSize.width / window.devicePixelRatio;

  Color cacheAreaColor = Color(0x3340C4FF);
  Color screenBackground = Colors.lightBlueAccent;

  int listItems = 0;
  List<Color> itemColors = [Colors.red,Colors.orange, Colors.yellow, Colors.green, Colors.cyan, Colors.blue, Colors.purple];

  double globalDelta = 0;
  double get fakeScrollOffset => globalDelta;
  double get cacheOrigin => globalDelta.clamp(0, cacheHeight);
  double get scrollOffset => fakeScrollOffset - cacheOrigin;
  double get targetEndScrollOffset => fakeScrollOffset + localScreenHeight + cacheHeight;
  int get childCount => targetEndScrollOffset ~/ itemHeight + 1;

  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();

    // todo web animate not work
    // animationController = AnimationController(
    //     duration: const Duration(seconds: 3), vsync: this);
    // Animation<int> alpha = IntTween(begin: 0, end: 255).animate(animationController);
    // alpha.addListener(() {
    //   print('alpha:${alpha.value}');
    // });

  }

  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
      child: Stack(alignment: Alignment.bottomRight,children: [
        Container(width: screenWidth, height: screenHeight, child:  Stack(
            alignment: Alignment.topCenter,
            children: [
              _buildScreenLayer(),
              _buildListViewLayer(),
              _buildTopSizeIndicatorLayer(),
            ],
          )),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 32, 32), child: FloatingActionButton(onPressed: () {
          _startSimulateAnimate();
        }, child: Icon(Icons.play_circle_fill),),),
    ],));
  }

  bool forward = true;
  _startSimulateAnimate() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        if (forward) globalDelta++;
        else globalDelta--;
        if (globalDelta > 275) {
          globalDelta = 275;
          forward = false;
        }
        if (globalDelta == 0 && !forward) {
          timer.cancel();
          forward = true;
        }

        _simulateHandleChild();
      });
    });
  }

  _simulateHandleChild() {
    if (scrollOffset > itemHeight && itemColors.first.value != Colors.transparent.value) {
      // globalDelta -= itemHeight;
      Color firstColor = itemColors.removeAt(0);
      itemColors.insert(0, Colors.transparent);
      itemColors.add(firstColor);
    } else if (scrollOffset < itemHeight && itemColors.first.value == Colors.transparent.value) {
      itemColors.removeAt(0);
      Color lastColor = itemColors.removeLast();
      itemColors.insert(0, lastColor);
    }
  }

  _buildScreenLayer() {
    return Container(
      height: cacheScreenBottom,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end, // todo row height
        children: [
          SizeIndicator(
            length: fakeScrollOffset + localScreenHeight + cacheHeight,
            direction: Axis.vertical,
            explain: 'targetEndScrollOffset',
          ),
          Container(width: sizeIndicatorHeight,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Container(height: cacheHeight,),
              SizeIndicator(
                length: fakeScrollOffset,
                direction: Axis.vertical,
                explain: 'fake scroll offset',
              ),
              SizeIndicator(
                length: localScreenHeight,
                direction: Axis.vertical,
                explain: 'screen height',
              ),
              SizeIndicator(
                length: cacheHeight,
                direction: Axis.vertical,
                explain: 'cache extent',
              ),
            ],
          ),
          Column(children: [
            Container(height: cacheScreenTop,),
            Container(width: localScreenWidth,height: cacheHeight, color: cacheAreaColor,),
            Container(width: localScreenWidth,height: localScreenHeight, color: screenBackground,),
            Container(width: localScreenWidth,height: cacheHeight, color: cacheAreaColor,),
          ],),
          Container(width: sizeIndicatorHeight,),
          Container(width: sizeIndicatorHeight * 2,),
        ],
      ),
    );
  }

  _buildListViewLayer() {
    return Positioned(
      top: listViewContentAnchor - fakeScrollOffset,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            int delta = -details.delta.dy.toInt();
            if (delta > 0 && fakeScrollOffset > cacheHeight + itemHeight + topMargin / 2) return;
            if (globalDelta > 275) globalDelta = 275;
            globalDelta += delta;
            if (globalDelta < 0) globalDelta = 0;

            _simulateHandleChild();
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: _buildListItems(),
            ),
            SizeIndicator(length: childCount * itemHeight, direction: Axis.vertical, color: Colors.blueGrey,),
          ],
        ),
      ),
    );
  }

  _buildTopSizeIndicatorLayer() {
    return Container(height: cacheScreenTop + cacheHeight,child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(width: sizeIndicatorHeight * 3,),
        Container(width: localScreenWidth - sizeIndicatorHeight * 4,),
        Column(mainAxisSize: MainAxisSize.min,children: [
          SizeIndicator(length: scrollOffset, direction: Axis.vertical, explain: 'scroll offset', color: Colors.black,),
          Container(width: sizeIndicatorHeight * 3, alignment: Alignment.bottomRight,child: SizeIndicator(length: cacheOrigin, direction: Axis.vertical, explain: 'cache origin', color: Colors.orangeAccent,)),
        ],),
      ],
    ),);
  }

  _buildListItems() {
    return childCount.toList()
        .map((index) => Container(
          width: itemWidth,
          height: itemHeight,
          color: itemColors[index % itemColors.length],)
        ).toList();
  }
}

extension xxx on int {
  List<int> toList() {
    List<int> result = [];
    if (this < 0) return null;
    for (int i = 0; i < this; i++) {
      result.add(i);
    }
    return result;
  }
}
