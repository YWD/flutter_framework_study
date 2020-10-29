// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class COut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CProvider(CCount(0), child: CRoute());
  }
}


class CRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Builder(builder: (context) {
        CCount c = CProvider.of(context).data;
        return Text('$c');
      }),
      FlatButton(onPressed: () {
        CCount c = CProvider.of(context).data;
        c.add();
      }, child: Icon(Icons.add)),
    ],);
  }
}


class CProvider<T> extends InheritedWidget {
  CProvider(this.data, {Key key , @required this.child}): super(key: key, child: child);

  final T data;
  final Widget child;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  Widget build(BuildContext context) {
    return this.child;
  }

  static CProvider of<T>(BuildContext context) {
    // ChangeNotifier notifier = data as ChangeNotifier;
    // notifier.addListener(context);
    return context.findAncestorWidgetOfExactType<CProvider>();
  }
}

class CCount extends ChangeNotifier {
  CCount(this.count);

  int count;

  void add() {
    count++;
    notifyListeners();
  }
}

class ProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      /// Providers are above [MyApp] instead of inside it, so that tests
      /// can use [MyApp] while mocking the providers
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Counter()),
        ],
        child: MyApp(),
      );
  }
}


/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyHomePage build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

            /// Extracted as a separate widget for performance optimization.
            /// As a separate widget, it will rebuild independently from [MyHomePage].
            ///
            /// This is totally optional (and rarely needed).
            /// Similarly, we could also use [Consumer] or [Selector].
            const Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Count build');
    return Text(

      /// Calls `context.watch` to make [MyHomePage] rebuild when [Counter] changes.
        '${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}

class PModel extends ChangeNotifier {
  PModel(this._count);
  int _count = 0;

  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}

class PRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MultiProvider(providers: [
        ChangeNotifierProvider<PModel>(create: (_) => PModel(0)),
      ], child: Consumer<PModel>(builder: (context, pModel, child) {
        return Column(
          children: [
            Text('text value: ${pModel.count}'),
            FlatButton(onPressed: () {
              pModel.add();
            }, child: Icon(Icons.add)),
          ],
        );
      },),),
    );
  }
}















class DData extends ChangeNotifier {
  int _count;
  DData(this._count);

  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}

class SSave<T> extends InheritedWidget {
  final T data;

  SSave(this.data, Widget child): super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

}

class WidgetG<T extends ChangeNotifier> extends StatefulWidget {
  @override
  _WidgetGState createState() => _WidgetGState<T>();
}

class _WidgetGState<T extends ChangeNotifier> extends State<WidgetG> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class PProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T data;
  final Widget child;

  PProvider(this.data, this.child, {Key key}): super(key: key);

  @override
  _PProviderState createState() => _PProviderState<T>();

  static T of<T>(BuildContext context) {
    SSave<T> widget = context.dependOnInheritedWidgetOfExactType<SSave<T>>();
    print('widget:$widget');
    return widget.data;
  }
}

class _PProviderState<T extends ChangeNotifier> extends State<PProvider> {

  _update() => setState(() {});

  @override
  void initState() {
    super.initState();
    print('PP data : ${widget.data}');
    widget.data.addListener(_update);
    print('type of T: ${T.toString()}');
  }

  @override
  void dispose() {
    super.dispose();
    widget.data.removeListener(_update);
  }

  @override
  Widget build(BuildContext context) {
    return SSave<T>(widget.data, widget.child);
  }
}

class PPRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PProvider<DData>(DData(0), Builder(builder: (context) {
        print('builder build');
        print('context is Stateless Element: ${context is StatelessElement}');
        DData data = PProvider.of<DData>(context);
        print('data:$data');
        if (data == null) return Container(color: Colors.yellow);
        return Column(children: [
          Builder(builder: (context) {
            return Text('build text:${data.count}');
          },),
          FlatButton(onPressed: () {
            data.add();
          }, child: Icon(Icons.add)),
        ],);
      },)),
    );
  }
}

class DDData extends ChangeNotifier {
  int _count;
  DDData(this._count);

  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}

class IInheritedWidget<T> extends InheritedWidget {
  IInheritedWidget(this.data, Widget child): super(child: child) {
    print('IInheritedWidget T.toString:${T.toString()}');
  }
  final T data;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class PListenerProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T data;
  final Widget child;
  PListenerProvider(this.data, this.child);
  @override
  _PListenerProviderState createState() => _PListenerProviderState<T>();

  static G of<G extends ChangeNotifier>(BuildContext context) {
    IInheritedWidget<G> widget = context.dependOnInheritedWidgetOfExactType<IInheritedWidget<G>>();
    print('type of G: ${G.toString()}');
    return widget.data;
  }
}

class _PListenerProviderState<G> extends State<PListenerProvider> {
  // 这里的T是对应widget给的没问题，但是这只是一个类，别的地方给编译器怎么知道具体T是什么东西

  _update() => setState(() {
    print('PListenerProvider setState');
  });

  @override
  void initState() {
    super.initState();

    print('T.toString:${G.toString()}');
    widget.data.addListener(_update);
  }

  @override
  void dispose() {
    super.dispose();
    widget.data.removeListener(_update);
  }
  @override
  Widget build(BuildContext context) {
    print('widget.data.type:${widget.data.runtimeType}');
    print('widget.data is T:${widget.data is G}');
    print('T.toString:${G.toString()}');
    return IInheritedWidget(widget.data as G, widget.child);
  }
}

class PPPRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PListenerProvider(DDData(0), Builder(
        builder: (context) {
          print('builder build');
          DDData data = PListenerProvider.of(context);
          return Column(children: [
            Builder(builder: (context) {
              print('child builder one build');
              return Text('data:${data.count}');
            }),
            Builder(
              builder: (context) {
                print('child builder two build');
                return GestureDetector(onTap: () {
                  data.add();
                }, child: Icon(Icons.add),);
              }
            ),
          ],);
        }
      )),
    );
  }
}




