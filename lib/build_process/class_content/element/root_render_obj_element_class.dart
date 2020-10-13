import 'package:web_app/build_process/widgets/class_content_widget.dart';

import 'render_obj_element_class.dart';

class RootRenderObjElementClass extends RenderObjElementClass {
  RootRenderObjElementClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  // static const String theName = 'ComponentElement';
  // static const List<String> theMethods = [];
  // static const List<ClassContentWidget> theExtendsOrMixIns = [ElementClass.d()];
  factory RootRenderObjElementClass.d() {
    return RootRenderObjElementClass('RootRenderObjElement', [
      '1-1-1-1↓ assignOwner','1-1-1-3↑ mount',
    ], [RenderObjElementClass.d(),]);
  }
}