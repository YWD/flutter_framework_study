import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/app_dev/router/books_app.dart';
import 'package:provider/provider.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;

  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

final counter = CounterModel();
final textSize = 48;

// class Parent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider<int>.value(
//       value: textSize,
//       child: ChangeNotifierProvider.value(
//         value: counter,
//         child: MyApp(),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: Text(
          'value:${_counter.value}',
          style: TextStyle(fontSize: textSize),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Consumer2<CounterModel, int>(
        builder: (context, counter, testSize, _) => Center(
          child: Text(
            'Value: ${counter.value}',
            style: TextStyle(
              fontSize: testSize.toDouble(),
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}





class ParentT extends StatelessWidget {
  // final BookList bookList = BookList();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookList(),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Builder(
            builder: (context) {
              // BookList bookList = Provider.of(context);
              print('builder build');
              return Material(
                child: MediaQuery(
                  data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    // child: ListView.builder(itemBuilder: (context, index) {
                    //   Book book = bookList.elementAt(index);
                    //   return ListTile(title: Text(book.name), trailing: StatefulBuilder(
                    //     builder: (context, setState) {
                    //       print('stateful builder build');
                    //       return IconButton(icon:
                    //         book.isFavorite? Icon(Icons.favorite, color: Colors.red,): Icon(Icons.favorite_border), onPressed: () {
                    //           setState(() {bookList.collect(index);});
                    //       },);
                    //     }
                    //   ),);
                    // }, itemCount: bookList.count,),
                    child: Selector<BookList, BookList>(
                      selector: (context, bookList) => bookList,
                      shouldRebuild: (pre, old) => false,
                      builder: (context, bookList, child) {
                        return ListView.builder(itemBuilder: (context, index) {
                          Book book = bookList.elementAt(index);
                          print('list view build');
                          return ListTile(title: Text(bookList.elementAt(index).name),
                            trailing: Selector<BookList, Book>(
                              selector: (context, bookList) => bookList.elementAt(index),
                              shouldRebuild: (pre, next) {
                                print('pre: ${pre.isFavorite}');
                                print('next: ${next.isFavorite}');
                                return pre.isFavorite != next.isFavorite;
                              },
                              builder: (context, book, child) {
                                print('IconButton build');
                                return IconButton(icon: book.isFavorite ? Icon(Icons.favorite, color: Colors.red,): Icon(Icons.favorite_border), onPressed: () {
                                  bookList.collect(index);
                                },);
                              }
                            ),);
                        }, itemCount: bookList.count,);
                    },),
                  ),
                ),
              );
            }
          );
        }
      ),
    );
  }
}

class Book {
  String name;
  bool isFavorite;

  Book(this.name,  this.isFavorite);
}

class BookList with ChangeNotifier {
  List<Book> _books = List.generate(20, (index) => Book('book $index', false));

  int get count => _books.length;

  Book elementAt(int index) => _books[index];

  void collect(int index) {
    Book book = _books[index];
    Book newBook = Book(book.name, !book.isFavorite);
    // book.isFavorite = !book.isFavorite;
    _books[index] = newBook;

    notifyListeners();
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

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ChangeNotifierProvider(
        create: (_) => MyData(),
        child: Column(
          children: [
            Builder(builder: (context) {
              print('context is StatelessElement which widget is Builder:'
                  '${(context as StatelessElement).widget is Builder}');
              MyData data = Provider.of(context);
              return Text('data:${data.count}');
            },),
            Builder(builder: (context) {
              print('点我 builder build');
              MyData data = Provider.of(context);
              return FlatButton(onPressed: () {
                data.add();
              }, child: Text('点我'));
            }),
            Consumer<MyData>(builder: (context, data, child) {
              print('点点我 builder build');
              return FlatButton(onPressed: () {
                data.add();
              }, child: Text('点点我'));
            },),
            Builder(builder: (context) {
              return FlatButton(onPressed: () {
                context.read<MyData>().add();
              }, child: Text('还要点我'));
            },),
          ],
        ),
      ),
    );
  }
}






