import 'package:flutter/material.dart';
// import 'package:web_app/app_dev/navigator/navigator_study.dart';
// import 'package:web_app/app_dev/navigator/nested_navigator.dart';
// import 'package:web_app/app_dev/router/books_app.dart';
// import 'package:web_app/widgets_study/app_widget_tree.dart';
// import 'package:web_app/widgets_study/lifecycle.dart';
// import 'package:web_app/widgets_study/rebuild_sub_widget.dart';
//
// import 'app_dev/state_manage/provider_study.dart';
// import 'build_process/source_code_block.dart';
// import 'widgets_study/did_update_widget.dart';

void main() {
  // runApp(SourceCodeBlock());
  // runApp(AppWidgetTree());
  // runApp(navigatorStudyApp);
  // runApp(NestedNavigator());
  // runApp(BooksApp());
  // runApp(NavigatorContainer());
  // runApp(ProviderRoute());
  // runApp(RebuildContainer());
  // runApp(TurnBoxRoute());
  // runApp(WidgetLifecycle());

  runApp(Container(color: Colors.red,));
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
