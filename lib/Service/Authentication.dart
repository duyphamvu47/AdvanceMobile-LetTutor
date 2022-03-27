import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  static final Authentication instance = Authentication._internal();
  var sharedPreferences;


  String ID = "";
  String password = "";

  factory Authentication() {
    return instance;
  }

  Authentication._internal() {
    setUp();
  }

  void setUp() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool authenticate(String id, String pass){
    String password = "";
    password = sharedPreferences.getString(id);
    if (password == pass){
      sharedPreferences.setString("Login", id);
      return true;
    }
    return false;
  }

  bool isUserExistence(String id){
    String password = "";
    password = sharedPreferences.getString(id);
    if (password != null){
      return true;
    }
    return false;
  }

  bool changePassword(String ID, String password){
    if (isUserExistence(ID)){
      sharedPreferences.setString(ID, password);
      return true;
    }
    else{
      return false;
    }
  }
}