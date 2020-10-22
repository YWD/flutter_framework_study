import 'package:flutter/material.dart';

import 'class_content/app_class.dart';
import 'class_content/binding/widgets_flutter_binding_class.dart';
import 'class_content/element/render_obj2_widget_element_class.dart';
import 'class_content/element/stateful_element_class.dart';
import 'class_content/element/stateless_element_class.dart';
import 'class_content/state/material_app_state.dart';
import 'class_content/widget/material_app_class.dart';
import 'class_content/widget/render_obj2_widget_adapter_class.dart';
import 'class_content/widget/source_cb_widget_class.dart';

class SourceCodeBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
            AppClass(),
            Container(width: 8,),

            WidgetsFlutterBindingClass(),
            Container(width: 8,),

            RenderObj2WidgetAdapterClass.d(),
            Container(width: 8,),

            RenderObj2WidgetElementClass.d(),
            Container(width: 8,),

            Padding(
              padding: const EdgeInsets.only(top: 64),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SourceCBWidgetClass.d(),
                  Container(width: 8,),

                  StatelessElementClass.d(),
                  Container(width: 8,),
                ],),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 128),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialAppClass.d(),
                  Container(width: 8,),

                  MaterialAppState.d(),
                  Container(width: 8,),

                  StatefulElementClass.d(),
                  Container(width: 8,),
                ],),
            ),
          ],),
          // todo build process and lifecycle not clear
          Text('createElement -> mount -> build(child Widget) -> updateChild -> inflateWidget(child.createElement)', style: TextStyle(fontSize: 18, color: Colors.black),),
          Text('createElement -> mount -> build(child Widget) -> updateChild -> inflateWidget(child.createElement)', style: TextStyle(fontSize: 18, color: Colors.black),),
        ],
      ),
    );
  }
}