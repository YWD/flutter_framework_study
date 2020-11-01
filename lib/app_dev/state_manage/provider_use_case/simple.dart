import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';
import 'package:provider/provider.dart';

class ProviderSimple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DirectionWidget(
        child: Provider(
          key: null,
          create: (BuildContext context) {
            return Book();
          },
          dispose: (context, value) {

          },
          lazy: false,
          builder: (context, child) {
            return child;
          },
          child: Builder(builder: (context) {
            return Text('${context.watch<Book>().name}: ${context.watch<Book>().no}');

            // return Text('${Provider.of<Book>(context).name}: ${Provider.of<Book>(context).no}');
            // return Text('${context.select((Book book) => book.name)}:-- ${context.select((Book book) => book.no)}');
          },),
        ),
    );
  }
}

class Book {
  int no = 123456;
  String name = 'book name';
}

class ProviderSimpleValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print('ProviderSimpleValue build');
    // Future.delayed(Duration(seconds: 5), () {
    //   count.count++;
    //   StatelessElement element = context;
    //   element.markNeedsBuild();
    // });
    return DirectionWidget(child: Provider.value(
      value: count,
      updateShouldNotify: (pre, next) {
        return pre != next;
      },
      builder: (context, child) {
        return Text('the value is: ${context.select((Count count) => count.count)}');
      },
      child: null,
    ));
  }
}

class Count {
  Count(this._count);
  int _count = 0;
  String code;

  int get count => _count;
  set count(int value) {
    code = 'code:$value';
    _count = value;
  }
}

Count count = Count(32);
