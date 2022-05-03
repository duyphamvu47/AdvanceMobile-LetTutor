import 'package:flutter/material.dart';
import 'package:lettutor/constant.dart';


class WaitingScreen extends StatefulWidget {
  const WaitingScreen({Key? key,
    required this.beginTime,
    required this.endTime}) : super(key: key);

  final DateTime beginTime;
  final DateTime endTime;

  @override
  _WaitingScreen createState() => _WaitingScreen();
}

class _WaitingScreen extends State<WaitingScreen> with TickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _controller;
  // int levelClock = widget.beginTime.difference(widget.endTime).inSeconds;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
            calWaitingTime(widget.beginTime, widget.endTime)) // gameData.levelClock is a user entered number elsewhere in the applciation
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'The class will begin in: ',
            ),
            Countdown(
              animation: StepTween(
                begin: calWaitingTime(widget.beginTime, widget.endTime), // THIS IS A USER ENTERED NUMBER
                end: 0,
              ).animate(_controller),
            ),
          ],
        ),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({required this.animation}) : super(listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    print('animation.value  ${animation.value} ');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print('inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    if (animation.value == 0){
      // Navigate to class
    }

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 110,
        color: kPrimaryColor,
      ),
    );
  }
}

int calWaitingTime(DateTime begin, DateTime end){
  return begin.difference(end).inSeconds;
}