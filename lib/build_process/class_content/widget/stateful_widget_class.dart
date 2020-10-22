import 'package:web_app/build_process/widgets/class_content_widget.dart';

import 'widget_class.dart';

class StatefulWidgetClass extends WidgetClass {
  StatefulWidgetClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory StatefulWidgetClass.d() {
    return StatefulWidgetClass('StatefulWidget', [
      'createState',
    ], [WidgetClass('Widget', [
      '1-1-1-10-1-7-1-2-1 \ncreateElement',
    ], null),]);
  }
}