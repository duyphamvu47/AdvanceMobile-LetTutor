import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lettutor/Service/Api.dart';

import '../data/courses_json.dart';


class MyCourseViewModel extends Model {
  static final MyCourseViewModel instance = MyCourseViewModel._internal();

  List<Course> courseList = [];

  factory MyCourseViewModel() {
    return instance;
  }

  MyCourseViewModel._internal() {
    readJson();
  }



  Future<void> readJson() async {
    courseList = await API.instance.fetchMyCourse();
    notifyListeners();
  }


  List<Course> getCourseList(){
    readJson();
    return courseList;
  }



}