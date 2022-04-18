import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';

import '../data/courses_json.dart';


class ExploredViewModel extends Model {
  static final ExploredViewModel instance = ExploredViewModel._internal();

  List<Course> courseList = [];

  factory ExploredViewModel() {
    return instance;
  }

  ExploredViewModel._internal() {
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