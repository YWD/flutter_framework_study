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