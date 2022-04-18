import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Api.dart';

class Authentication {
  static final Authentication instance = Authentication._internal();
  var sharedPreferences;
  String token = "";


  String ID = "";
  String password = "";
  final body = {
    'username':'phhai@ymail.com',
    'password':'123456'
  };

  factory Authentication() {
    return instance;
  }

  Authentication._internal() {
    setUp();
  }

  Future<String> getToken() {
    return http.post(Uri.parse("https://sandbox.api.lettutor.com/auth/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email':'phhai@ymail.com',
          'password':'123456'
        })
    ).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200) {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        throw Exception(
            "StatusCode:$statusCode, Error:${response.reasonPhrase}");
      }

      const JsonDecoder _decoder = JsonDecoder();
      final body = _decoder.convert(jsonBody);
      token = body['tokens']['access']['token'];
      return token;
    });
  }

  void setUp() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> authenticate(String id, String pass) async {
    String? password = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    password = preferences.getString(id);
    if (password == pass) {
      sharedPreferences.setString("Login", id);
      API.token = await Authentication.instance.getToken();
      return true;
    }
    return false;
  }

  Future<bool> isUserExistence(String id) async{
    String? password = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    password = preferences.getString(id);
    if (password != null){
      return true;
    }
    return false;
  }


  Future<bool> signUp(String email, String password){
    return http.post(Uri.parse("https://sandbox.api.lettutor.com/auth/register"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password
        })
    ).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 201) {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        // throw Exception("StatusCode:$statusCode, Error:${response.reasonPhrase}");
        return false;
      }

      return true;
    });
  }

  Future<bool> changePassword(String ID, String password) async{
    var isExist = await isUserExistence(ID);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (isExist){
      preferences.setString(ID, password);
      return true;
    }
    else{
      return false;
    }
  }
}