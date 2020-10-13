import 'package:web_app/build_process/widgets/class_content_widget.dart';

import 'element_class.dart';

class RenderObjElementClass extends ElementClass {
  RenderObjElementClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  // static const String theName = 'ComponentElement';
  // static const List<String> theMethods = [];
  // static const List<ClassContentWidget> theExtendsOrMixIns = [ElementClass.d()];
  factory RenderObjElementClass.d() {
    return RenderObjElementClass('RenderObjElement', [
      '1-1-1-4↑ mount','1-1-1-7↓ attachRenderObject',
    ], [ElementClass.d(),]);
  }
}