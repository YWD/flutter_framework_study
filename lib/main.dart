import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/app_dev/navigator/navigator_study.dart';
import 'package:web_app/app_dev/navigator/nested_navigator.dart';
import 'package:web_app/widgets_study/app_widget_tree.dart';

import 'build_process/source_code_block.dart';

void main() {
  // runApp(SourceCodeBlock());
  // runApp(AppContainer());
  runApp(navigatorStudyApp);
  // runApp(NestedNavigator());

  // todo text yellow underline
  // todo text size
  // todo divider
  // todo constraint
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Out();
  }
}

class Out extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(builder: (context, child) {
      return Text('test text');
    }, color: Colors.yellow,);
  }
}
