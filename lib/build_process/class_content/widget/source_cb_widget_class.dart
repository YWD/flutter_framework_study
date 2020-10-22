import 'package:web_app/build_process/widgets/class_content_widget.dart';

import 'stateless_widget_class.dart';

class SourceCBWidgetClass extends StatelessWidgetClass {
  SourceCBWidgetClass(String className, List<String> methods, List<ClassContentWidget> extendsOrMixIns) : super(className, methods, extendsOrMixIns);

  factory SourceCBWidgetClass.d() {
    return SourceCBWidgetClass('SourceCBWidget', [
      '1-1-1-10-1-7-1→ \nbuild(new Widget)',
    ], [StatelessWidgetClass.d(),]);
  }
}