import 'package:flutter_web/build_process/widgets/class_content_widget.dart';

import 'element_class.dart';

class ComponentElementClass extends ElementClass {
  ComponentElementClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  // static const String theName = 'ComponentElement';
  // static const List<String> theMethods = [];
  // static const List<ClassContentWidget> theExtendsOrMixIns = [ElementClass.d()];
  factory ComponentElementClass.d() {
    return ComponentElementClass('ComponentElement', [
      '1-1-1-10-1-1↑ mount','1-1-1-10-1-4↑ \n_firstBuild', '1-1-1-10-1-6↓ \nperformRebuild',
    ], [ElementClass('Element', [
      '1-1-1-10-1-2↓ mount',
      '1-1-1-10-1-3↓ \n_updateInheritance',
      '1-1-1-10-1-5↓ \nrebuild',
      '*1-1-1-10-1-7-1-1↓ \nupdateChild',
      '*1-1-1-10-1-7-1-2→ \ninflateWidget\n(widget.child.creEle)',
    ], null),]);
  }
}