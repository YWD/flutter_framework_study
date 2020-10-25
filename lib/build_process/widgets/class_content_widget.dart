import 'package:flutter/material.dart';

class ClassContentWidget extends StatelessWidget {
  final String className;
  final List<String> methods;
  final List<ClassContentWidget> extendsOrMixIns;
  ClassContentWidget(this.className, this.methods, this.extendsOrMixIns);
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(constraints: BoxConstraints(maxWidth: 200),decoration: BoxDecoration(border: Border.all(color: Colors.grey), color: Colors.transparent,),child: Column(mainAxisSize: MainAxisSize.min,children: [
        _buildExtendsOrMixIns(),
        ListView.builder(itemBuilder: (context, index) {
          String content = methods[index];
          return Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              child: Text(content, style: TextStyle(color:
                content.contains('createElement') || content.contains('inflateWidget') ? Colors.red:Colors.black),),
            ),
            Container(height: 2, color: Colors.grey,),
          ],);
        }, itemCount: methods.length, shrinkWrap: true,),
        Container(color: Colors.lightBlue, width: 200 ,height: 30,child: Center(child: Text(className, style: TextStyle(color: Colors.yellow),)),)
      ],),),
    );
  }

  _buildExtendsOrMixIns() {
    if (extendsOrMixIns == null) return Container();
    return Container(padding: EdgeInsets.fromLTRB(6,6,6,6),child: ListView.builder(itemBuilder: (context, index) {
      return Column(
        children: [
          extendsOrMixIns[index],
          Container(height: 6,),
        ],
      );
    }, itemCount: extendsOrMixIns.length, shrinkWrap: true,),);
  }
}
