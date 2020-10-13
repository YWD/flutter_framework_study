import 'package:flutter/widgets.dart';
import 'package:web_app/widgets/class_content_widget.dart';

class RendererBindingClass extends ClassContentWidget {
  RendererBindingClass._(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory RendererBindingClass.d  () {
    return RendererBindingClass._('RendererBinding', [''], null);
  }
}
