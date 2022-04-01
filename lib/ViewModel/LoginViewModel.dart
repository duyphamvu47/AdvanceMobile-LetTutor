import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/courses_json.dart';


class LoginViewModel extends Model {
  static final LoginViewModel instance = LoginViewModel._internal();
  var sharedPreferences;
  Authentication authentication = Authentication.instance;

  List<Course> courseList = [];

  String ID = "";
  String password = "";

  factory LoginViewModel() {
    return instance;
  }

  LoginViewModel._internal() {
    setUp();
  }

  void setUp() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> authenticate() async{
    if (ID.isEmpty || password.isEmpty) return false;

    return authentication.authenticate("user_" + ID, password);
  }


}