import 'package:flutter/material.dart';

class DirectionWidget extends StatelessWidget {
  final Widget child;
  DirectionWidget({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child: child);
  }
}
