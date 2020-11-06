
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'cloud_widget.dart';

class CloudDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(color: Colors.yellow, builder: (context, _) {
      return CloudDemo();
    },);
  }
}


///云词图
class CloudDemo extends StatefulWidget {
  @override
  _CloudDemoState createState() => _CloudDemoState();
}

class _CloudDemoState extends State<CloudDemo> {

  ///Item数据
  List<CloudItemData> dataList = const <CloudItemData>[
    CloudItemData('11111111111111', Colors.amberAccent, 10, false),
    CloudItemData('22222222222222', Colors.limeAccent, 16, false),
    CloudItemData('33333333333333', Colors.black, 14, true),
    CloudItemData('44444444444444', Colors.black87, 33, false),
    CloudItemData('55555555555555', Colors.blueAccent, 15, false),
    CloudItemData('66666666666666', Colors.indigoAccent, 16, false),
    CloudItemData('77777777777777', Colors.deepOrange, 12, true),
    CloudItemData('88888888888888', Colors.blue, 20, true),
    CloudItemData('99999999999999', Colors.blue, 12, false),
    CloudItemData('00000000000000', Colors.deepPurpleAccent, 14, false),
    CloudItemData('CloudGSY%%%%', Colors.orange, 20, true),
    CloudItemData('CloudGSY%%%%%%%', Colors.blue, 12, false),
    CloudItemData('CloudGSY&&&&', Colors.indigoAccent, 10, false),
    CloudItemData('CloudGSYCCCC', Colors.yellow, 14, true),
    CloudItemData('CloudGSY****', Colors.blueAccent, 13, false),
    CloudItemData('CloudGSYRRRR', Colors.redAccent, 12, true),
    CloudItemData('CloudGSYFFFFF', Colors.blue, 12, false),
    CloudItemData('CloudGSYBBBBBBB', Colors.cyanAccent, 15, false),
    CloudItemData('CloudGSY222222', Colors.blue, 16, false),
    CloudItemData('CloudGSY1111111111111111', Colors.tealAccent, 19, false),
    CloudItemData('CloudGSY####', Colors.black54, 12, false),
    CloudItemData('CloudGSYFDWE', Colors.purpleAccent, 14, true),
    CloudItemData('CloudGSY22222', Colors.indigoAccent, 19, false),
    CloudItemData('CloudGSY44444', Colors.yellowAccent, 18, true),
    CloudItemData('CloudGSY33333', Colors.lightBlueAccent, 17, false),
    CloudItemData('CloudGSYXXXXXXXX', Colors.blue, 16, true),
    CloudItemData('CloudGSYFFFFFFFF', Colors.black26, 14, false),
    CloudItemData('CloudGSYZUuzzuuu', Colors.blue, 16, true),
    CloudItemData('CloudGSYVVVVVVVVV', Colors.orange, 12, false),
    CloudItemData('CloudGSY222223', Colors.black26, 13, true),
    CloudItemData('CloudGSYGFD', Colors.yellow, 14, true),
    CloudItemData('GGGGGGGGGG', Colors.deepPurpleAccent, 14, false),
    CloudItemData('CloudGSYFFFFFF', Colors.blueAccent, 10, true),
    CloudItemData('CloudGSY222', Colors.limeAccent, 12, false),
    CloudItemData('CloudGSY6666', Colors.blue, 20, true),
    CloudItemData('CloudGSY33333', Colors.teal, 14, false),
    CloudItemData('YYYYYYYYYYYYYY', Colors.deepPurpleAccent, 14, false),
    CloudItemData('CloudGSY  3  ', Colors.blue, 10, false),
    CloudItemData('CloudGSYYYYYY', Colors.black54, 17, true),
    CloudItemData('CloudGSYCC', Colors.lightBlueAccent, 11, false),
    CloudItemData('CloudGSYGGGGG', Colors.deepPurpleAccent, 10, false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,

          ///利用 FittedBox 约束 child
          child: new FittedBox(
            /// Cloud 布局
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              color: Colors.brown,

              ///布局
              child: CloudWidget(
                ///容器宽高比例
                ratio: 1,
                children: <Widget>[
                  for (var item in dataList)

                    ///判断是否旋转
                    RotatedBox(
                      quarterTurns: item.rotate ? 1 : 0,
                      child: Text(
                        item.text,
                        style: new TextStyle(
                          fontSize: item.size,
                          color: item.color,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CloudItemData {
  ///文本
  final String text;

  ///颜色
  final Color color;

  ///旋转
  final bool rotate;

  ///大小
  final double size;

  const CloudItemData(
    this.text,
    this.color,
    this.size,
    this.rotate,
  );
}
