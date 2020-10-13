import 'package:web_app/class_content/element/component_element_class.dart';
import 'package:web_app/widgets/class_content_widget.dart';

class StatefulElementClass extends ComponentElementClass {
  StatefulElementClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory StatefulElementClass.d() {
    return StatefulElementClass('MAppStatefulElement', [
      '1-1-1-10-1-7-1-2-2-7\nbuild←(state.build)',
    ], [ComponentElementClass('ComponentElement', [
      '1-1-1-10-1-7-1-2-2-1\nmount↓',
      '1-1-1-10-1-7-1-2-2-4\n_firstBuild↑',
      '1-1-1-10-1-7-1-2-2-6\nperformRebuild',
    ], [ClassContentWidget('Element', [
      '1-1-1-10-1-7-1-2-2-2\nmount↓',
      '1-1-1-10-1-7-1-2-2-3\n_updateInheritance↓',
      '1-1-1-10-1-7-1-2-2-5\nrebuild↓',
      '*1-1-1-10-1-7-1-2-2-7-1-1\nupdateChild',
      '*1-1-1-10-1-7-1-2-2-7-1-2\ninflateWidget\n(widget.child.creEle)',
    ], null)]),]);
  }
}