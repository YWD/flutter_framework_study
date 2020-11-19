import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/widgets_study/my_scaffold.dart';

const platformMethod = MethodChannel('__platform_method__');
const platformEvent = EventChannel('__platform_event__');

class MethodChannelDemo extends StatefulWidget {
  @override
  _MethodChannelDemoState createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  @override
  void initState() {
    super.initState();

    platformMethod.setMethodCallHandler((call) {
      switch (call.method) {
        case 'helloDart':
          return Future<String>.value('Hello Android');
        default :
          return call.noSuchMethod(null);
      }
    });

    platformEvent.receiveBroadcastStream().listen((event) {
      print('dart listen: $event');
    });
  }

  String result = '';

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
            onPressed: () async {
              result = await platformMethod.invokeMethod('doSomething');
              setState(() {
              });
            },
            child: Text('invoke method:'),
          ),
          FlatButton(
            onPressed: () {
              var buffer = Uint16List.fromList([1, 2]).buffer;
              var data = ByteData.view(buffer);
              platformEvent.binaryMessenger.send('__platform_event__', data);
            },
            child: Text('invoke method:'),
          ),
          Container(color: Colors.blue,child: Text('result:$result')),
        ],
      ),
    );
  }
}
