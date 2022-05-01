import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lettutor/ViewModel/ScheduleViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key, required this.title, required this.ID}) : super(key: key);

  final String title;
  final String ID;

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late MeetingDataSource _events;
  late List<Appointment> _shiftCollection;


  @override
  void initState() {
    ScheduleViewModel.instance.ID = widget.ID;
    ScheduleViewModel.instance.fetchData();
    addAppointments();
    _events = MeetingDataSource(_shiftCollection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ScheduleViewModel.instance,
      child: SafeArea(
          child: Scaffold(
              body: getBody(),
          )
      ),
    );
  }

  Widget getBody(){
    return ScopedModelDescendant<ScheduleViewModel>(
        builder: (BuildContext context, Widget? child, ScheduleViewModel model){
          return SfCalendar(
              view: CalendarView.timelineWeek,
              firstDayOfWeek: 1,
              timeSlotViewSettings:
              TimeSlotViewSettings(startHour: 12, endHour: 24),
              dataSource: MeetingDataSource(model.appointments),
            onTap: (CalendarTapDetails details) {
                model.bookClass(details.appointments?.first);
            },
          );
        }
    );
  }

  void addAppointments() {
    var subjectCollection = [
      'General Meeting',
      'Plan Execution',
      'Project Plan',
      'Consulting',
      'Support',
      'Development Meeting',
      'Scrum',
      'Project Completion',
      'Release updates',
      'Performance Check'
    ];

    var colorCollection = [
      const Color(0xFF0F8644),
      const Color(0xFF8B1FA9),
      const Color(0xFFD20100),
      const Color(0xFFFC571D),
      const Color(0xFF85461E),
      const Color(0xFF36B37B),
      const Color(0xFF3D4FB5),
      const Color(0xFFE47C73),
      const Color(0xFF636363)
    ];

    _shiftCollection = <Appointment>[];

    for (int j = 0; j < 365; j++) {
      for (int k = 0; k < 2; k++) {
        final DateTime date = DateTime.now().add(Duration(days: j + k));
        int startHour = 9 + Random().nextInt(6);
        startHour =
        startHour >= 13 && startHour <= 14 ? startHour + 1 : startHour;
        final DateTime shift5tartTime = DateTime(
            date.year, date.month, date.day, startHour, 0, 0);
        _shiftCollection.add(
            Appointment(
              startTime: shift5tartTime,
              endTime: shift5tartTime.add(Duration(hours: 1)),
              subject: subjectCollection[Random().nextInt(8)],
              color: colorCollection[Random().nextInt(8)],
              startTimeZone: '',
              endTimeZone: ''
            )
        ); // Appointment
      }
    }
  }

}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> shiftCollection) {
    appointments = shiftCollection;
  }
}