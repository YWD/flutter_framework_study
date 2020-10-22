import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RebuildContainer extends StatefulWidget {
  @override
  _RebuildContainerState createState() => _RebuildContainerState();
}

class _RebuildContainerState extends State<RebuildContainer> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    print('RebuildSubContainer build');
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(children: [
          Builder(builder: (_) {
            print('brother build');
            return Text('我是brother');
          }),
          StatefulBuilder(builder: (context, _setState) {
            print('StatefulBuilder build');
            return Container(child: GestureDetector(onTap: () {
              _setState(() {
                print('神奇');
              });
            },child: Text('神奇的 StatefulBuilder')),);
          }),
          Builder(builder: (context) {
            print('CheckBox builder build');
            return Checkbox(value: checkBoxValue, onChanged: (value) {
              checkBoxValue = !checkBoxValue;
              (context as Element).markNeedsBuild();
            });
          }),
        ],),
      ),
    );
  }
}
