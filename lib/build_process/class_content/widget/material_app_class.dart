import 'package:flutter_web/build_process/widgets/class_content_widget.dart';

import 'stateful_widget_class.dart';

class MaterialAppClass extends StatefulWidgetClass {
  MaterialAppClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory MaterialAppClass.d() {
    return MaterialAppClass('MaterialApp', [
      '1-1-1-10-1-7-1-2-2 \ncreateState→',
    ], [StatefulWidgetClass.d(),]);
  }
}