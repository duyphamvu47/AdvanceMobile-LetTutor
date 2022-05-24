import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/model/Course.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/courses_json.dart';


class ForgotPasswordViewModel extends Model {
  static final ForgotPasswordViewModel instance = ForgotPasswordViewModel._internal();
  Authentication authentication = Authentication.instance;

  String ID = "";

  factory ForgotPasswordViewModel() {
    return instance;
  }

  ForgotPasswordViewModel._internal() {
  }

  Future<bool> forgotPassword() async{
    return await authentication.forgotPassword(ID);
  }


}