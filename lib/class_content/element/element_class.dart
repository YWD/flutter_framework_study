import 'package:web_app/widgets/class_content_widget.dart';

class ElementClass extends ClassContentWidget {
  ElementClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  static const String theName = 'Element';
  // static const List<String> theMethods = ['1-1-1-5 mount', 'element 2'];

  factory ElementClass.d() {
    return ElementClass(theName, ['1-1-1-5↓ mount', '1-1-1-6↓ _updateInheritance', '1-1-1-9↓ updateChild', '1-1-1-10← \n inflateWidget\n(widget.child.creEle)'], null);
  }
}