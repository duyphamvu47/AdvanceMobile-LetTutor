import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lettutor/Screens/WaitingScreen/waiting_screen.dart';
import 'package:lettutor/Utils.dart';
import 'package:lettutor/ViewModel/MyCoursesViewModel.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../Service/Authentication.dart';
import '../../constant.dart';
import '../../model/MyAppointment.dart';
import '../../model/User.dart';
import '../TutorSchedule/schedule_screen.dart';

class MySchedule extends StatefulWidget {
  MySchedule({Key? key}) : super(key: key);


  @override
  _MySchedule createState() => _MySchedule();
}

class _MySchedule extends State<MySchedule> {
  late List<Appointment> _shiftCollection;


  @override
  void initState() {
    MyScheduleViewModel.instance.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MyScheduleViewModel.instance,
      child: SafeArea(
          child: Scaffold(
            body: getBody(),
          )
      ),
    );
  }

  Widget getBody(){
    return ScopedModelDescendant<MyScheduleViewModel>(
        builder: (BuildContext context, Widget? child, MyScheduleViewModel model){
          if (model.isLoading){
            return loadingScreen();
          }
          else{
            return SfCalendar(
              view: CalendarView.timelineDay,
              firstDayOfWeek: 1,
              timeSlotViewSettings:
              TimeSlotViewSettings(startHour: 12, endHour: 24),
              dataSource: MeetingDataSource(model.appointments),
              onTap: (CalendarTapDetails details) {
                MyAppointment shift = model.findCourseWithID(details.appointments?.first?.id);
                DateTime now = DateTime.now();
                DateTime beginTime = details.appointments?.first?.startTime;
                DateTime endTime = details.appointments?.first?.endTime;
                if (now.isAfter(beginTime) && now.isBefore(endTime)){
                  User? user = Authentication.instance.userData;
                  _joinMeeting(shift, user);
                }
                else if (now.isBefore(beginTime)){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                      return WaitingScreen(beginTime: now, endTime: beginTime, data: shift);
                      },
                    ),
                  );
                }
                else if (now.isAfter(endTime)){
                  Utils.showSnackBar(context, "The class has finished");
                }
              },
              onLongPress: (CalendarLongPressDetails details){
                      print("LongPress");
                      showDialog(
                      context: context,
                      builder: (context) => buildDeleteAlert(context, model, details.appointments?.first),
                      barrierDismissible: false,
                      );
              },

            );
          }
        }
    );
  }

  Widget loadingScreen(){
    return Center(
        child: SpinKitCircle(
          size: 140,
          color: Colors.grey,
        )
    );
  }

}

Widget buildDeleteAlert(BuildContext context, MyScheduleViewModel model , Appointment appointment){
  return AlertDialog(
    content: Form(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delete this appointment ?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RoundedButton(text: "Cancel", color: Colors.white, textColor: Colors.black , press: (){
                    Navigator.pop(context);
                  }),
                  RoundedButton(text: "Delete", color: kPrimaryColor, textColor: Colors.white , press: (){
                    deleteClass(context, model, appointment.id as String);
                    Navigator.pop(context);
                  })
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}


void deleteClass(BuildContext context, MyScheduleViewModel model, String ID){
  print(ID);
  model.deleteACourse(ID).then((value) {
    if (value){
      Utils.showSnackBar(context, "Class has been deleted");
      Navigator.pop(context);
    }
    else {
      Utils.showSnackBar(context, "Fail to delete class");
      Navigator.pop(context);
    }
  });
}

_joinMeeting(MyAppointment data, User? user) async {
  try {
    FeatureFlag featureFlag = FeatureFlag();
    featureFlag.welcomePageEnabled = false;
    featureFlag.resolution = FeatureFlagVideoResolution
        .MD_RESOLUTION; // Limit video resolution to 360p

    var options = JitsiMeetingOptions(
        room: "${data.userId}-${data.scheduleDetailInfo?.scheduleInfo!
            .tutorId}")
      ..serverURL = "https://meet.lettutor.com${data.studentMeetingLink
          ?.substring(6, data.studentMeetingLink?.length)}"
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
