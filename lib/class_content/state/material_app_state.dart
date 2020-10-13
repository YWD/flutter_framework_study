import 'package:web_app/widgets/class_content_widget.dart';

class MaterialAppState extends ClassContentWidget {
  MaterialAppState(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory MaterialAppState.d() {
    return MaterialAppState('MaterialAppState', [
      '1-1-1-10-1-7-1-2-2-7-1\nbuild',
    ], [ClassContentWidget('State', [''], null)]);
  }
}