import 'package:flutter/widgets.dart';
import 'package:web_app/widgets/class_content_widget.dart';

class WidgetsBindingClass extends ClassContentWidget {
  WidgetsBindingClass._(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory WidgetsBindingClass.d() {
    return WidgetsBindingClass._('WidgetsBinding', ['1-1→ attachRootWidget'], null);
  }
}
