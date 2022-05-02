import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Api.dart';
import 'package:lettutor/model/Course.dart';
import 'package:lettutor/model/Schedule.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../data/courses_json.dart';


class ScheduleViewModel extends Model {
  static final ScheduleViewModel instance = ScheduleViewModel._internal();

  List<Shift> shifts = [];
  List<Appointment> appointments = [];
  String ID = "";

  factory ScheduleViewModel() {
    return instance;
  }

  ScheduleViewModel._internal() {
  }

  void fetchData() async {
    shifts = await API.instance.fetchTutorSchedule(ID);
    appointments = shifts.map((e) => e.toAppointment()).toList();
    print("Fetch " + appointments.length.toString() + " shitfts");
    notifyListeners();
  }

  Future<bool> bookClass(String ID) async{

    return await API.instance.bookClass(ID);
    print(ID);
    if (ID.isNotEmpty){
      API.instance.bookClass(ID).then((value) {
        if (value){
          fetchData();
          return true;
        }
        return false;
      });
    }
  }

}