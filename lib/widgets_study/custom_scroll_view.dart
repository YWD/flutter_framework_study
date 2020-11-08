import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

class CustomScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
      // todo
      // child: IntrinsicHeight(child: Column(children: [
      //   Expanded(child: Container(width: 50, height: 100, color: Colors.red,)),
      //   Container(width: 50, height: 300, color: Colors.green,),
      //   Container(width: 50, height: 100, color: Colors.blue,),
      // ],),),
      child: Center(
        child: Container(
          height: 300,
          child: IntrinsicHeight(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    color: Colors.red,
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.green,
                  height: 100,
                ),
                Expanded(
                  child: Container(
                    width: 100,
                    height: 200,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // child: Column(children: [
      //   Row(children: [
      //     Text('12345'),
      //   ],),
      // ],),
      // child: Row(children: [
      //   Container(
      //     color: Colors.red,
      //     child: Column(children: [
      //       Text('123'),
      //     ],),
      //   ),
      // ],),
    );
  }
}

class CustomScrollViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2,
        child: LayoutBuilder(
          builder: (context, viewPortConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewPortConstraints.maxHeight,
                ),
                // child: Column(
                //   mainAxisSize: MainAxisSize.min,
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: <Widget>[
                //     Container(
                //       // A fixed-height child.
                //       color: const Color(0xffeeee00), // Yellow
                //       height: 240.0,
                //       alignment: Alignment.center,
                //       child: const Text('Fixed Height Content'),
                //     ),
                //     Container(
                //       // Another fixed-height child.
                //       color: const Color(0xff008000), // Green
                //       height: 240.0,
                //       alignment: Alignment.center,
                //       child: const Text('Fixed Height Content'),
                //     ),
                //   ],
                // ),

                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Container(
                        // A fixed-height child.
                        color: const Color(0xffeeee00), // Yellow
                        height: 240.0,
                        alignment: Alignment.center,
                        child: const Text('Fixed Height Content'),
                      ),
                      Expanded(
                        // A flexible child that will grow to fit the viewport but
                        // still be at least as big as necessary to fit its contents.
                        child: Container(
                          color: const Color(0xffee0000), // Red
                          height: 240.0,
                          alignment: Alignment.center,
                          child: const Text('Flexible Content'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomScrollViewDe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: ColoredBox(
        color: Colors.green,
        child: Container(
          color: Colors.yellow,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: window.physicalSize.width / window.devicePixelRatio,
                height: 60,
                child: ColoredBox(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomScrollViewDem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // title: Text("标题"),
              expandedHeight: 230.0,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('FlexibleSpaceBar'),
                centerTitle: true,
                collapseMode: CollapseMode.pin,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text("Item $index"),
                ),
                childCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
