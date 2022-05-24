import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/courses_json.dart';

enum SignUpResult {
  existed,
  notMatch,
  success
}


class SignUpViewModel extends Model {
  static final SignUpViewModel instance = SignUpViewModel._internal();
  var sharedPreferences;
  Authentication authentication = Authentication.instance;

  List<Course> courseList = [];

  String ID = "";
  String password = "";
  String password_ = "";

  factory SignUpViewModel() {
    return instance;
  }

  SignUpViewModel._internal() {
    setUp();
  }

  void setUp() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> signUp() async{
    if (password != password_){
      return false;
    }

    return await Authentication.instance.signUp(ID, password);
  }
}