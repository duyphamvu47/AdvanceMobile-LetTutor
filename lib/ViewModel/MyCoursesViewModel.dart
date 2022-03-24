import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';

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
    final String response = await rootBundle.loadString('assets/data/course.json');
    Map<String, dynamic> data = await json.decode(response);
    for (var i = 0; i < data.length; i++) {
      courseList.add(Course.fromJson(data[i]));
    }
  }



}