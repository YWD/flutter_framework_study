import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // title: Text("标题"),
              expandedHeight: 230.0,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('FlexibleSpaceBar'),
                centerTitle: true,
                collapseMode: CollapseMode.pin,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                  title: Text("Item $index"),
                ),
                childCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
