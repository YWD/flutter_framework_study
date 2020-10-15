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
  'Focus',
  'Actions',
  'MediaQuery',
  'Localizations',
  'Directionality',
  'Tile',
  'CheckedModeBanner',
  'Banner',
  'CustomPaint',
  'DefaultTextStyle',
  'Theme',
  'CupertinoTheme',
  'IconTheme',
  'Navigator',
  'HeroControllerScope',
  'Listener',
  '...',

  // 'MaterialPageRoute',
  // '_ModalScopeStatus',
  'AbsorbPointer',
  'Overlay',
  '_Theatre',

  // _Theatre1
  'ModalBarrier',
  'RawGestureDetector',
  // _Theatre2
  '_ModalScope',
  '_ModalScopeStatus',
  'Offstage',
  'PageStorage',
  'FocusScope',
  'RepaintBoundary',
  'AnimatedBuilder',
  'CupertinoPageTransition',
  'SlideTransition',
  '...',
  'Stack',
  'AnimatedBuilder',
  'Text',
  'RichText',

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
