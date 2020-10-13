import 'package:web_app/class_content/element/component_element_class.dart';
import 'package:web_app/widgets/class_content_widget.dart';

class StatelessElementClass extends ComponentElementClass {
  StatelessElementClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory StatelessElementClass.d() {
    return StatelessElementClass('StatelessElement', [
      '1-1-1-10-1-7← \nbuild',
    ], [ComponentElementClass.d(),]);
  }
}