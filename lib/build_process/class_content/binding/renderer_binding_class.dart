import 'package:web_app/build_process/widgets/class_content_widget.dart';

class RendererBindingClass extends ClassContentWidget {
  RendererBindingClass._(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory RendererBindingClass.d  () {
    return RendererBindingClass._('RendererBinding', [''], null);
  }
}
