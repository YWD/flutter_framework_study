import 'package:web_app/class_content/element/element_class.dart';
import 'package:web_app/widgets/class_content_widget.dart';

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