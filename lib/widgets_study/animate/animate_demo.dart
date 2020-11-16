import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web/my_widgets/direction_widget.dart';

class AnimateTicker extends StatefulWidget {
  @override
  _AnimateTickerState createState() => _AnimateTickerState();
}

class _AnimateTickerState extends State<AnimateTicker> {
  
  Ticker _ticker;
  int count = 0;
  int _startTime;
  
  @override
  void initState() {
    super.initState();
    
    _ticker = Ticker((elapsed) {
      debugPrint('$count elapsed:$elapsed');
      count++;
      // if (DateTime.now().millisecondsSinceEpoch - _startTime > 1000) {
      //   _ticker.stop();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DirectionWidget(child: Container(
      color: Colors.white,
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: () {
            count = 0;
            _ticker.start();
            _startTime = DateTime.now().millisecondsSinceEpoch;
          }, child: Icon(Icons.play_circle_fill),),
          FloatingActionButton(onPressed: () {
            _ticker.muted = true;
          }, child: Icon(Icons.play_circle_fill),),
          FloatingActionButton(onPressed: () {
            _ticker.stop();
          }, child: Icon(Icons.play_circle_fill),),
          FloatingActionButton(onPressed: () {
            setState(() {
              print('setState');
            });
          }, child: Icon(Icons.play_circle_fill),),
        ],
      ),),
    ),);
  }
}
