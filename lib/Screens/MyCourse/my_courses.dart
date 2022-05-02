import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lettutor/ViewModel/MyCoursesViewModel.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../constant.dart';
import '../../data/courses_json.dart';
import '../Home/components/custom_heading.dart';
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

            },
            onLongPress: (CalendarLongPressDetails details){
                  () => showDialog(
                context: context,
                builder: (context) => buildDeleteAlert(details.appointments?.first),
                barrierDismissible: false,
              );
            },
          );
        }
    );
  }
}

Widget buildDeleteAlert(Appointment appointment){
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
                  RoundedButton(text: "Cancel", color: Colors.white, textColor: Colors.black , press: (){}),
                  RoundedButton(text: "Delete", color: kPrimaryColor, textColor: Colors.white , press: (){})
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
