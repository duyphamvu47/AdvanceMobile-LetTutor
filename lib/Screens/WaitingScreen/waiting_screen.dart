import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/constant.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lettutor/model/MyAppointment.dart';

import '../../model/User.dart';


class WaitingScreen extends StatefulWidget {
  const WaitingScreen({Key? key,
    required this.beginTime,
    required this.endTime,
    required this.data
  }) : super(key: key);

  final DateTime beginTime;
  final DateTime endTime;
  final MyAppointment data;

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
              ).animate(_controller), data: widget.data,
            ),
          ],
        ),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({required this.data,required this.animation}) : super(listenable: animation);
  Animation<int> animation;
  final MyAppointment data;

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
      User? user = Authentication.instance.userData;
      _joinMeeting(data, user);
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

_joinMeeting(MyAppointment data, User? user) async {
  try {
    FeatureFlag featureFlag = FeatureFlag();
    featureFlag.welcomePageEnabled = false;
    featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p

    var options = JitsiMeetingOptions(room: "${data.userId}-${data.scheduleDetailInfo?.scheduleInfo!.tutorId}")
      ..serverURL = "https://meet.lettutor.com${data.studentMeetingLink?.substring(6, data.studentMeetingLink?.length)}"
      ..subject = "Learning"
      ..userDisplayName = user?.name
      ..userEmail = user?.email
      ..userAvatarURL = user?.avatar // or .png
      ..audioOnly = true
      ..audioMuted = true
      ..videoMuted = true;

    await JitsiMeet.joinMeeting(options);
  } catch (error) {
    debugPrint("error: $error");
  }
}