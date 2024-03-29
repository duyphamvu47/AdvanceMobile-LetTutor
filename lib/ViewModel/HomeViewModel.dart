import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Api.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';

import '../data/courses_json.dart';
import '../model/User.dart';


class HomeViewModel extends Model {
  static final HomeViewModel HomeVM_instance = HomeViewModel._internal();

  List<Course> relatedCourse = [];
  List<Course> myCourse = [];
  User? user;

  factory HomeViewModel() {
    return HomeVM_instance;
  }

  HomeViewModel._internal() {
    fetchData();
  }



  void fetchData() async {
    user = Authentication.instance.userData;
    relatedCourse = await API.instance.fetchRelatedCourse();
    notifyListeners();
  }

  void fetchMyCourse() async {
    myCourse = await API.instance.fetchMyCourse();
    notifyListeners();
  }

  List<Course> getMyCourse() {
   fetchMyCourse();
    return myCourse;
  }

  List<Course> getRelatedCourse(){
    fetchData();
    return relatedCourse;
  }

}