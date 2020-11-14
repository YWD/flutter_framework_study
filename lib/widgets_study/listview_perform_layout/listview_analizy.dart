import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';
import 'package:flutter_web/widgets_study/listview_perform_layout/listview_scroll_up.dart';
import 'package:flutter_web/widgets_study/my_size_indicator.dart';

class ListViewAnalyse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ListViewInitAnimate();
    return ListViewScrollUpAnimate();
  }
}

class ListViewInitAnimate extends StatefulWidget {
  @override
  _ListViewInitAnimateState createState() => _ListViewInitAnimateState();
}

class _ListViewInitAnimateState extends State<ListViewInitAnimate> with SingleTickerProviderStateMixin {

  Color color1 = Colors.transparent;
  Color color2 = Colors.transparent;
  Color color3 = Colors.transparent;
  Color color4 = Colors.transparent;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        color1 = Colors.red;
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        color2 = Colors.green;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        color3 = Colors.blue;
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        color4 = Colors.purple;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
      child: Container(
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizeIndicator(length: 380, direction: Axis.vertical, explain: 'screen height',),
                      SizeIndicator(length: 160, direction: Axis.vertical, explain: 'cache extent',),
                    ],
                  ),
                  Container(
                    width: 300,
                    height: 380,
                    color: Colors.lightBlueAccent,
                  ),
                  SizeIndicator(length: 540, direction: Axis.vertical, explain: 'targetEndScrollOffset',),
                ],
              ),
              LimitedBox(
                maxHeight: 600,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 280, height: 150, color: color1,),
                    Container(width: 280, height: 150, color: color2,),
                    Container(width: 280, height: 150, color: color3,),
                    Container(width: 280, height: 150, color: color4,),
                  ],
                ),
              ),
              _buildEndScrollOffset(),
            ],
          ),
        ),
      ),
    );
  }

  _buildEndScrollOffset() {
    double length = 0;
    if (color4 == Colors.purple) {
      length = 600;
    } else if (color3 == Colors.blue) {
      length = 450;
    } else if (color2 == Colors.green) {
      length = 300;
    } else if (color1 == Colors.red) {
      length = 150;
    }
    if (length == 0) return Container(height: 0,);
    return SizeIndicator(length: length, direction: Axis.vertical, explain: 'endScrollOffset', color: Colors.black,);
  }
}
