import 'package:web_app/class_content/element/component_element_class.dart';
import 'package:web_app/class_content/widget/render_obj_widget_class.dart';
import 'package:web_app/widgets/class_content_widget.dart';

class RenderObj2WidgetAdapterClass extends RenderObjWidgetClass {
  RenderObj2WidgetAdapterClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory RenderObj2WidgetAdapterClass.d() {
    return RenderObj2WidgetAdapterClass('RenderObj2WidgetA', [
      '1-1-1↑→ attachToRenderTree',
    ], [RenderObjWidgetClass.d(),]);
  }
}