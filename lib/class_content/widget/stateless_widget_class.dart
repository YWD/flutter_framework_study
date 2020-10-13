import 'package:web_app/class_content/element/component_element_class.dart';
import 'package:web_app/widgets/class_content_widget.dart';

import 'widget_class.dart';

class StatelessWidgetClass extends WidgetClass {
  StatelessWidgetClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory StatelessWidgetClass.d() {
    return StatelessWidgetClass('StatelessWidget', [
      '',
    ], [WidgetClass('Widget', [
      '1-1-1-10-1→ createElement',
    ], null),]);
  }
}