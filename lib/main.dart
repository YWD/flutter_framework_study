import 'package:flutter/material.dart';
import 'package:web_app/class_content/element/render_obj2_widget_element_class.dart';
import 'package:web_app/class_content/element/stateful_element_class.dart';
import 'package:web_app/class_content/element/stateless_element_class.dart';
import 'package:web_app/class_content/state/material_app_state.dart';
import 'package:web_app/class_content/widget/material_app_class.dart';
import 'package:web_app/class_content/widget/render_obj2_widget_adapter_class.dart';
import 'package:web_app/class_content/widget/source_cb_widget_class.dart';
import 'package:web_app/class_content/widget/stateful_widget_class.dart';
import 'package:web_app/class_content/binding/widgets_flutter_binding_class.dart';

import 'class_content/app_class.dart';
import 'class_content/widget/stateless_widget_class.dart';

void main() {
  runApp(SourceCodeBlock());
}

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
          Text('createElement -> mount -> build(child Widget) -> updateChild -> inflateWidget(child.createElement)', style: TextStyle(fontSize: 18, color: Colors.black),),
          Text('createElement -> mount -> build(child Widget) -> updateChild -> inflateWidget(child.createElement)', style: TextStyle(fontSize: 18, color: Colors.black),),
        ],
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        // todo text yellow underline
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 200),
              color: Colors.greenAccent,
              child: _buildAppColumn(),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 400),
              color: Colors.blueAccent,
              child: _buildWidgetsBindingColumn(),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> appColumn = ['App', 'runApp', 'print'];
  final List<String> appMethodOrdinal = ['0', '1', '2'];

  // todo text size
  _buildAppColumn() {
    return ListView.builder(
      itemBuilder: (context, index) {
        String content = appColumn[index];
        String ordinal = appMethodOrdinal[index];
        Widget column = Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ordinal == '0'
                      ? Container()
                      : Container(
                    color: Colors.yellow,
                    child: Text(
                      ordinal,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            // todo Divider()
            Container(
              color: Colors.grey,
              height: 1,
            ),
          ],
        );

        if (index == 0)
          return Row(
            children: [
              column, // todo Container divider, constraints
            ],
          );
        return column;
      },
      itemCount: appColumn.length,
    );
  }

  final List<String> widgetsBindingColumn = [
    'WidgetsBinding',
    'RenderObj2WidgetAdapter',
    'RenderObj2WidgetElement'
  ];
  final List<String> widgetsBindingColumnOrdinal = ['0', '1-1', '1-2'];

  _buildWidgetsBindingColumn() {
    return ListView.builder(
      itemBuilder: (context, index) {
        String content = widgetsBindingColumn[index];
        String ordinal = widgetsBindingColumnOrdinal[index];
        Widget column = Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ordinal == '0'
                      ? Container()
                      : Container(
                          color: Colors.red,
                          child: Text(
                            ordinal,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                  Text(
                    content,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              height: 1,
            ),
          ],
        );

        if (index == 0)
          return Row(
            children: [
              column,
            ],
          );
        return column;
      },
      itemCount: appColumn.length,
    );
  }
}