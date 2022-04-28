import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lettutor/ViewModel/MyCoursesViewModel.dart';
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
            TimeSlotViewSettings(startHour: 12, endHour: 24, timeInterval: Duration(minutes: 15)),
            dataSource: MeetingDataSource(model.appointments),
            onTap: (CalendarTapDetails details) {

            },
          );
        }
    );
  }

}
