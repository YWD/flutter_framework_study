import 'package:flutter/widgets.dart';
import 'package:web_app/class_content/binding/renderer_binding_class.dart';
import 'package:web_app/class_content/binding/widgets_binding_class.dart';
import 'package:web_app/widgets/class_content_widget.dart';

class WidgetsFlutterBindingClass extends StatelessWidget {
  final className = 'WidgetsFlutterBinding';
  final List<String> methods = [''];
  final List<ClassContentWidget>  extendsOrMixIns = [RendererBindingClass.d(), WidgetsBindingClass.d()];
  @override
  Widget build(BuildContext context) {
    return ClassContentWidget(className, methods, extendsOrMixIns);
  }

}
