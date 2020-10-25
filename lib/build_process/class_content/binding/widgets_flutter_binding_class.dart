import 'package:flutter/widgets.dart';
import 'package:flutter_web/build_process/widgets/class_content_widget.dart';

import 'renderer_binding_class.dart';
import 'widgets_binding_class.dart';

class WidgetsFlutterBindingClass extends StatelessWidget {
  final className = 'WidgetsFlutterBinding';
  final List<String> methods = [''];
  final List<ClassContentWidget>  extendsOrMixIns = [RendererBindingClass.d(), WidgetsBindingClass.d()];
  @override
  Widget build(BuildContext context) {
    return ClassContentWidget(className, methods, extendsOrMixIns);
  }

}
