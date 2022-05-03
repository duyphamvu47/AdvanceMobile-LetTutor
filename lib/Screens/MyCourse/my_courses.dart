import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/Screens/WaitingScreen/waiting_screen.dart';
import 'package:lettutor/Utils.dart';
import 'package:lettutor/ViewModel/MyCoursesViewModel.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../constant.dart';
import '../../data/courses_json.dart';
import '../../model/Schedule.dart';
import '../Home/components/custom_heading.dart';
import '../Login/login_screen.dart';
import '../TutorSchedule/schedule_screen.dart';
import 'components/custom_my_course_cell.dart';
import 'components/my_course_header.dart';
import 'components/my_course_list.dart';

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
          return SfCalendar(
            view: CalendarView.timelineDay,
            firstDayOfWeek: 1,
            timeSlotViewSettings:
            TimeSlotViewSettings(startHour: 12, endHour: 24),
            dataSource: MeetingDataSource(model.appointments),
            onTap: (CalendarTapDetails details) {
              Shift shift = model.findCourseWithID(details.appointments?.first?.id);
              DateTime now = DateTime.now();
              DateTime beginTime = details.appointments?.first?.startTime;
              DateTime endTime = details.appointments?.first?.endTime;
              if (now.isAfter(beginTime) && now.isBefore(endTime)){
                // GO to class
              }
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context) {return WaitingScreen(beginTime: now, endTime: beginTime);},),);
              }
            },
            onLongPress: (CalendarLongPressDetails details){
                  () => showDialog(
                context: context,
                builder: (context) => buildDeleteAlert(context, model, details.appointments?.first),
                barrierDismissible: false,
              );
            },
          );
        }
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
                    deleteClass(context, model, appointment.id as String);
                  }),
                  RoundedButton(text: "Delete", color: kPrimaryColor, textColor: Colors.white , press: (){
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
