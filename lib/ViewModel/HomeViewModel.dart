import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Api.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';

import '../data/courses_json.dart';


class HomeViewModel extends Model {
  static final HomeViewModel HomeVM_instance = HomeViewModel._internal();

  List<Course> courseList = [];

  factory HomeViewModel() {
    return HomeVM_instance;
  }

  HomeViewModel._internal() {
    fetchData();
  }



  void fetchData() async {
    courseList = await API.instance.fetchCourse();
    notifyListeners();
  }



}