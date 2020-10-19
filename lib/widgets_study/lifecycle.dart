import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetLifecycle extends StatefulWidget {

  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();


}

class _WidgetLifecycleState extends State<WidgetLifecycle> {

  bool firstNotThird = false;
  GlobalKey key = GlobalKey(debugLabel: 'lifecycle');

  @override
  void initState() {  // stateful widget -> stateful element -> state --> initState
    super.initState();
  }

  @override
  void didChangeDependencies() {  // after initState / InheritedWidget -> InheritedElement --> updated
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant WidgetLifecycle oldWidget) { // parent widget rebuild, if this widget can 'update' will reuse this widget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void reassemble() {   // hot reload
    super.reassemble();
    print('reassemble');
  }

  @override
  void deactivate() {   // called when the widget is removed from the widget tree
    super.deactivate();
  }

  @override
  void dispose() {    // after drawFrame finalizeTree -> unMountAll -> forEach dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
    child: Container(child: Center(child: Column(
      children: [
        firstNotThird ? Lifecycle(key: key,) : Container(),
        FlatButton(child: Text('打他'), onPressed: () {setState(() {
          firstNotThird = !firstNotThird;
          print('firstNotThird:$firstNotThird');
        });},),
        firstNotThird ? Container() : Lifecycle(key: key,),
      ],
    ))));
  }
}

class Lifecycle extends StatefulWidget {
  Lifecycle({key}): super(key: key);

  @override
  _LifecycleState createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle> {

  @override
  void didUpdateWidget(covariant Lifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      children: [
        Text('1234'),
        FlatButton(onPressed: () {
          setState(() {

          });
        }, child: Text('点我'),)
      ],
    ),);
  }
}
