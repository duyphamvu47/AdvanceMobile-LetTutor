import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lettutor/Service/Api.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../data/courses_json.dart';
import '../model/Schedule.dart';


class MyScheduleViewModel extends Model {
  static final MyScheduleViewModel instance = MyScheduleViewModel._internal();

  List<Shift> shifts = [];
  List<Appointment> appointments = [];

  factory MyScheduleViewModel() {
    return instance;
  }

  MyScheduleViewModel._internal() {
  }

  void fetchData() async {
    bool flag = true;
    int page = 1;
    while (flag){
      List<Shift> temp = await API.instance.fetchMySchedule(page);
      shifts.addAll(temp);
      if (temp.length != 10){
        flag = false;
      }
      else{
        page++;
      }
    }
    appointments = shifts.map((e) => e.toAppointment()).toList();
    print("Fetch " + appointments.length.toString() + " shitfts");
    notifyListeners();
  }

  Shift findCourseWithID(String ID){
    return shifts.firstWhere((element) => element.id == ID);
  }

  Future<bool> deleteACourse(String ID) async{
    return await API.instance.deleteClass(ID);
  }


}