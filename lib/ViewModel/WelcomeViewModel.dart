import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Api.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/courses_json.dart';


class WelcomeViewModel extends Model {
  static final WelcomeViewModel instance = WelcomeViewModel._internal();

  bool isLogin = false;

  factory WelcomeViewModel() {
    return instance;
  }

  WelcomeViewModel._internal() {
    checkLoginStatus();
  }


  void checkLoginStatus() async{
    // Authentication.instance.checkLoginStatus().then((value) => isLogin = value);
  }

}