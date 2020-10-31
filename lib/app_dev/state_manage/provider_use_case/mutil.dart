import 'package:flutter/material.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';
import 'package:provider/provider.dart';

class MultiProvide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(child: MultiProvider(providers: [
      Provider.value(value: 32),
      ChangeNotifierProvider(create: (context) {
        return MyData();
      }),
    ], child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Builder(builder: (context) {
        print('value builder build');
        return Text('the provider value is:${context.watch<int>()}');
      },),
      Builder(builder: (context) {
        print('MyData builder build');
        return Text('MyData.count is: ${context.select((MyData value) => value.count)}');
      }),
      Builder(builder: (context) {
        print('MyData add builder build');
        return FlatButton(onPressed: () {
          context.read<MyData>().add();
        }, child: Icon(Icons.add));
      }),
    ],),),));
  }
}

class MyData with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}
