import 'package:flutter/material.dart';
import 'package:flutter_web/platform_channel/method_channel.dart';
import 'package:flutter_web/widgets_study/animate/animate_demo_e.dart';
import 'package:flutter_web/widgets_study/animate/implict_anim.dart';
import 'package:flutter_web/widgets_study/row.dart';
import 'package:flutter_web/widgets_study/will_pop_up.dart';

import 'widgets_study/animate/explicit_anim.dart';

@pragma('vm:entry-point')
void entry() {
  runApp(PopDemo());
  // runApp(MethodChannelDemo());
}

@pragma('vm:entry-point')
void init() {
  runApp(Container(color: Colors.purple,));
}

void main() {
  runApp(PopDemo());
  // runApp(ExplicitAnim());
  // runApp(ImplicitAnim());
  // runApp(AnimateDemoE());
  // runApp(AnimateTicker());
  // runApp(RowDemo());
  // runApp(LinearTween());
  // runApp(ListViewAnalyse());
  // runApp(Center(child: SizeIndicator(length: 400, direction: Axis.vertical, explain: 'length',)));
  // runApp(SingleChildScrollV());
  // runApp(CanvasLayerDemo());
  // runApp(ListViewDemo());
  // runApp(CustomScrollViewDemo());
  // runApp(MyPaintDemo());
  // runApp(ThermometerPage(width: 300, degree: 50,));
  // runApp(ClockPage());
  // runApp(PositionDemo());
  // runApp(CloudDemoPage());
  // runApp(StickHeaderDemo());
  // runApp(ConstraintPage());
  // runApp(ColorBox());
  // runApp(CTripPage());
  // runApp(CircleCircle());
  // runApp(MyRender());
  // runApp(StickHeaderApp());
  // runApp(BuilderWrapper());
  // runApp(SourceCodeBlock());
  // runApp(AppWidgetTree());
  // runApp(navigatorStudyApp);
  // runApp(NestedNavigator());
  // runApp(BooksApp());
  // runApp(NavigatorContainer());
  // runApp(ProviderRoute());
  // runApp(RebuildContainer());
  // runApp(TurnBoxRoute());
  // runApp(WidgetLifecycle());
  // runApp(MyApp());
  // runApp(ProviderExample());
  // runApp(PRoute());
  // runApp(PPRoute());
  // runApp(ProviderRoute());
  // runApp(PPPRoute());
  // runApp(Parent());
  // runApp(ProviderSimpleNotifier());
  // runApp(ProviderSimple());
  // runApp(ProviderSimpleValue());
  // runApp(MultiProvide());
  // runApp(BuilderWrapper());



  // todo text yellow underline
  // todo text size
  // todo divider
  // todo constraint

  // runApp(GestureDetector(onTap: () {
  //   debugDumpLayerTree();
  // },child: Container(color: Colors.orange,child: PhysicalModel(color: Colors.red, child: Container(margin: EdgeInsets.all(50),color: Colors.yellow,width: 200, height: 200,),))));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
