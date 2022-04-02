import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/courses_json.dart';


class ResetPasswordViewModel extends Model {
  static final ResetPasswordViewModel instance = ResetPasswordViewModel._internal();
  var sharedPreferences;
  Authentication authentication = Authentication.instance;

  String password_ = "";
  String password = "";

  factory ResetPasswordViewModel() {
    return instance;
  }

  ResetPasswordViewModel._internal() {
    setUp();
  }

  void setUp() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> changePassword() async{
    String ID = sharedPreferences.getString("forgot_password");
    return await authentication.changePassword("user_" + ID, password);
  }


}