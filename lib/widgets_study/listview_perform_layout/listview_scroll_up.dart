import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

import '../my_size_indicator.dart';

class ListViewScrollUpAnimate extends StatefulWidget {
  @override
  _ListViewScrollUpAnimateState createState() => _ListViewScrollUpAnimateState();
}

class _ListViewScrollUpAnimateState extends State<ListViewScrollUpAnimate> {

  double localScreenWidth = 300;
  double localScreenHeight = 380;
  double cacheHeight = 160;
  double itemHeight = 150;
  double itemWidth = 280;
  double anchor = 300;
  double indicatorHeight = 24.0;
  
  Color color1 = Colors.red;
  Color color2 = Colors.green;
  Color color3 = Colors.blue;
  Color color4 = Colors.purple;

  double fakeScrollOffset = 0;
  double cacheOrigin = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Container(height: anchor, child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: localScreenWidth,
                    height: cacheHeight,
                    color: Color(0x3340C4FF),
                    child: Center(child: Text('cache area', style: TextStyle(color: Colors.black),),),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,children: [
                    SizeIndicator(length: fakeScrollOffset, direction: Axis.vertical, explain: 'fake scroll offset',),
                    Container(width: localScreenWidth - indicatorHeight * 2,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(width: indicatorHeight * 2, alignment: Alignment.centerLeft,child: SizeIndicator(length: fakeScrollOffset - cacheOrigin, direction: Axis.vertical, explain: 'scroll offset', color: Colors.black,)),
                        SizeIndicator(length: cacheOrigin, direction: Axis.vertical, explain: 'cache origin', color: Colors.black,),
                      ],
                    ),
                  ],),
                ],
              ),),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizeIndicator(length: localScreenHeight, direction: Axis.vertical, explain: 'screen height',),
                      SizeIndicator(length: cacheHeight, direction: Axis.vertical, explain: 'cache extent',),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: localScreenWidth,
                        height: localScreenHeight,
                        color: Colors.lightBlueAccent,
                      ),
                      Container(
                        width: localScreenWidth,
                        height: cacheHeight,
                        color: Color(0x3340C4FF),
                        child: Center(child: Text('cache area', style: TextStyle(color: Colors.black),),),
                      ),
                    ],
                  ),
                  SizeIndicator(length: localScreenHeight + cacheHeight, direction: Axis.vertical, explain: 'targetEndScrollOffset',),
                ],
              ),
            ],
          ),
          Positioned(
            top: anchor - fakeScrollOffset,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  int delta = -details.delta.dy.toInt();
                  if (cacheOrigin >= fakeScrollOffset)
                    cacheOrigin += delta;
                  fakeScrollOffset += delta;

                  cacheOrigin = cacheOrigin.clamp(0, cacheHeight);
                  fakeScrollOffset = max(0, fakeScrollOffset);
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: itemWidth, height: itemHeight, color: color1,),
                  Container(width: itemWidth, height: itemHeight, color: color2,),
                  Container(width: itemWidth, height: itemHeight, color: color3,),
                  Container(width: itemWidth, height: itemHeight, color: color4,),
                ],
              ),
            ),
          ),
          Positioned(
            top: anchor - fakeScrollOffset,
              child: _buildEndScrollOffset()),
        ],
      ),
    );
  }

  _buildEndScrollOffset() {
    double length = 0;
    if (color4 == Colors.purple) {
      length = 4 * itemHeight;
    } else if (color3 == Colors.blue) {
      length = 3 * itemHeight;
    } else if (color2 == Colors.green) {
      length = 2 * itemHeight;
    } else if (color1 == Colors.red) {
      length = itemHeight;
    }
    if (length == 0) return Container(height: 0,);
    return SizeIndicator(length: length, direction: Axis.vertical, explain: 'endScrollOffset', color: Colors.black,);
  }
}
