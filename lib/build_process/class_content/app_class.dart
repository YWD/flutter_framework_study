import 'package:flutter/widgets.dart';
import 'package:flutter_web/build_process/widgets/class_content_widget.dart';

// todo extends ClassContentWidget?
class AppClass extends StatelessWidget {
  final className = 'App';
  final List<String> methods = ['0↓ main', '1→ runApp'];
  @override
  Widget build(BuildContext context) {
    return ClassContentWidget(className, methods, null);
  }
}