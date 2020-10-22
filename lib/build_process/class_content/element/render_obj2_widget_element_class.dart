import 'package:web_app/build_process/widgets/class_content_widget.dart';

import 'root_render_obj_element_class.dart';

class RenderObj2WidgetElementClass extends RootRenderObjElementClass {
  RenderObj2WidgetElementClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  // static const String theName = 'ComponentElement';
  // static const List<String> theMethods = [];
  // static const List<ClassContentWidget> theExtendsOrMixIns = [ElementClass.d()];
  factory RenderObj2WidgetElementClass.d() {
    return RenderObj2WidgetElementClass('RenderObj2WidgetElement', [
      '1-1-1-2↑ mount', '1-1-1-8↑ _rebuild',
    ], [RootRenderObjElementClass.d(),]);
  }
}