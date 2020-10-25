import 'package:flutter_web/build_process/widgets/class_content_widget.dart';

class WidgetClass extends ClassContentWidget {
  WidgetClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory WidgetClass.d() {
    return WidgetClass('Widget', [
      '1-1-2→ createElement',
    ], null);
  }
}