import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Api.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';

import '../data/courses_json.dart';


class ExploredViewModel extends Model {
  static final ExploredViewModel instance = ExploredViewModel._internal();

  List<Course> searchResult = [];

  factory ExploredViewModel() {
    return instance;
  }

  ExploredViewModel._internal() {
  }


  void searchCourse(String keyword){
    if (keyword.isEmpty){
      searchResult = [];
      notifyListeners();
      return;
    }
    List<Course> courseList = API.courseList;
    List<Course> result = courseList.where((element) {
      var name = element.name;
      var description = element.description;
      var topics = element.topics?.toList();

      if (name != null){
        if (name.toLowerCase().contains(keyword)) return true;
      }

      if (description != null){
        if (description.toLowerCase().contains(keyword)) return true;
      }

      if (topics != null) {
        List<bool> temp = topics.map((e) {
          var name_ = e.name;
          var des = e.description;
          if (name_ != null) return name_.toLowerCase().contains(keyword);
          if (des != null) return des.toLowerCase().contains(keyword);
          return false;
        }).toList();
        return temp.contains(true);
      }
      return false;
    }).toList();
    searchResult = result;
    notifyListeners();
  }



}