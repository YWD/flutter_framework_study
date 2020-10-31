import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProviderSimpleNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
      child: ChangeNotifierProvider<MyData>(create: (BuildContext context) => MyData(),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Builder(builder: (context) {
            print('text builder build');
            return Text('you have push this button ${context.watch<MyData>().count} times');
          },),
          Builder(builder: (context) {
            print('button builder build');
            return FlatButton(onPressed: () {
              context.read<MyData>().add();
              // MyData data = context.read(); data.add();
              // Provider.of<MyData>(context, listen: false).add();
            }, child: Icon(Icons.add));
          },),
        ],),
      ),),
    );
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
