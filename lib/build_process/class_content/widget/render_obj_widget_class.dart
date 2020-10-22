import 'package:web_app/build_process/widgets/class_content_widget.dart';

import 'widget_class.dart';

class RenderObjWidgetClass extends WidgetClass {
  RenderObjWidgetClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory RenderObjWidgetClass.d() {
    return RenderObjWidgetClass('RenderObjWidget', [
      '',
    ], [WidgetClass.d(),]);
  }
}