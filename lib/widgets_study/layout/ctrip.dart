import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';
import 'package:flutter_web/widgets_study/layout/stick_headers/widget.dart';

class CTripPage extends StatefulWidget {
  @override
  _CTripPageState createState() => _CTripPageState();
}

class _CTripPageState extends State<CTripPage> {
  ScrollController ctrl = ScrollController();
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() {
      print('offset:${ctrl.offset}');
      setState(() {
        if (ctrl.offset < 200 - 48) {
          opacity = ctrl.offset / (200 - 48);
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
      child: Material(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Expanded(child: SingleChildScrollView(
                  controller: ctrl,
                  child: Column(children: [
                    Container(height: 200, color: Colors.red,),
                    StickyHeader(header: Container(height: 48, color: Colors.green,), content: Container(height: 200, color: Colors.blue,)),
                    Container(height: 300, color: Colors.black,),
                    Container(height: 300, color: Colors.white,),
                    Container(height: 300, color: Colors.black,),
                    Container(height: 300, color: Colors.white,),
                  ],),),),
              ],
            ),
            Opacity(
              opacity: opacity,
              child: Container(
                color: Colors.white,
                // width: MediaQuery.of(context).size.width,

                height: 48,
                alignment: Alignment.center,
                child: Text('title', style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

