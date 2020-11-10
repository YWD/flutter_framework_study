import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: DirectionWidget(child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(title: Text('list title $index'),);
        })),
      ),
    );
  }
}
