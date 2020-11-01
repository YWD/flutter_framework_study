import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

class BuilderWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StreamSubscription<String> subscription = myStream2().listen((event) {
      print('stream2 event:$event');
    }, onError: (error) {
      print('stream2 error:$error');
    }, onDone: () {
      print('stream2 done');
    });
    print('subscription:$subscription');
    Future.delayed(Duration(seconds: 20), () {
      subscription.cancel();
    });
    return DirectionWidget(
      child: Center(
        child: Material(child: Column(mainAxisSize: MainAxisSize.min, children: [
          Builder(builder: (context) {
            return Text('builder');
          },),
          StatefulBuilder(builder: (context, setState) {
            return FlatButton(onPressed: () {
              setState(() {});
            }, child: Text('StatefulBuilder'));
          }),
          // todo stream controller
          StreamBuilder<String>(stream: myStream(), builder: (context, snapshot) {
            return Text('StreamBuilder: ${snapshot.data}');
          }),
          // StreamBuilder<String>(stream: Stream.periodic(Duration(seconds: 2), (computeCount) => 'count:$computeCount'), builder: (context, snapshot) {
          //   return Text('StreamBuilder: ${snapshot.data}');
          // }),
          FutureBuilder<String>(future: Future.delayed(Duration(seconds: 5), () => '12345'),builder: (context, snapshot) {
            return Text('FutureBuilder:${snapshot.data}');
          }),
        ],),),
      ),
    );
  }
}

Stream<String> myStream() async*{
  yield 'first';
  // todo didn't work
  // sleep(Duration(seconds: 4));
  await Future.delayed(Duration(seconds: 4));
  yield 'second';
  await Future.delayed(Duration(seconds: 4));
  yield 'third';
}

Stream<String> myStream2() async*{
  yield 'first';
  sleep(Duration(seconds: 4));
  yield 'second';
  sleep(Duration(seconds: 4));
  yield 'third';
}