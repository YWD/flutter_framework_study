import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Anonymous())),
    );
  }
}

class Anonymous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: FlatButton(
            child: Text('点我'),
            onPressed: () {
              showLicensePage(context: context);
            },
          ),
        ),
        CascadeWidget(),
      ],
    );
  }
}

List<String> widgets = [
  'MaterialApp',
  'ScrollConfiguration',
  'HeroControllerScope',
  'WidgetsApp',
  'Shortcuts',
  'Actions',
  'DefaultTextStyle',
  'Navigator',
  'AbsorbPointer',
  'Overlay',
  '_Theatre',
];

class CascadeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (widgets.length == 0)
      return Container(
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.fromLTRB(6, 2, 6, 6),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Text('pages...\nscaffold/material\ncustom_page'));
    String text = widgets.removeAt(0);
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.fromLTRB(6, 2, 6, 6),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Text(text),
          CascadeWidget(),
        ],
      ),
    );
  }
}
