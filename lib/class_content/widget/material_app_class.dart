import 'package:web_app/class_content/element/component_element_class.dart';
import 'package:web_app/class_content/widget/stateful_widget_class.dart';
import 'package:web_app/widgets/class_content_widget.dart';

import 'widget_class.dart';

class MaterialAppClass extends StatefulWidgetClass {
  MaterialAppClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory MaterialAppClass.d() {
    return MaterialAppClass('MaterialApp', [
      '1-1-1-10-1-7-1-2-2 \ncreateState→',
    ], [StatefulWidgetClass.d(),]);
  }
}