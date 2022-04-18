import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/courses_json.dart';


class OTPScreenViewModel extends Model {
  static final OTPScreenViewModel instance = OTPScreenViewModel._internal();
  var sharedPreferences;
  Authentication authentication = Authentication.instance;

  String otpFromUser = "";
  String otpFromServer = "123";

  factory OTPScreenViewModel() {
    return instance;
  }

  OTPScreenViewModel._internal() {
    setUp();
  }

  void setUp() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool checkOTP(){
    return otpFromUser == otpFromServer;
  }


}