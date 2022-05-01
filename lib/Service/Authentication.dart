import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


class Token {
  String? token;
  String? expires;

  Token({this.token, this.expires});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expires'] = this.expires;
    return data;
  }
}

class Authentication {
  static final Authentication instance = Authentication._internal();
  String token = "";
  Token? accessToken;
  Token? refreshToken;
  User? userData;


  String ID = "";
  String password = "";

  factory Authentication() {
    return instance;
  }

  Authentication._internal() {
    // setUp();
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

  Future<bool> logIn(String id, String pass) {
    return http.post(Uri.parse("https://sandbox.api.lettutor.com/auth/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': id,
          'password': pass
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
      final access = body['tokens']['access'];
      final refresh = body['tokens']['refresh'];
      final Token accessToken = Token.fromJson(access);
      final Token refreshToken = Token.fromJson(refresh);
      final object = body['user'];
      userData = User.fromJson(object);
      this.accessToken = accessToken;
      this.refreshToken = refreshToken;
      print("User ID: " + (userData?.id ?? " "));
      saveInfo(accessToken, refreshToken);
      return true;
    });
  }

  void saveInfo(Token access, Token refresh) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("access", json.encode(access.toJson()));
    sharedPreferences.setString("refresh", json.encode(refresh.toJson()));
    sharedPreferences.setString("user_data", jsonEncode(userData?.toJson()));
    accessToken = accessToken;
    refreshToken = refreshToken;
  }

  Future<void> setUp() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessStr = sharedPreferences.getString("access");
    String? refreshStr = sharedPreferences.getString("refresh");
    String? user_data = sharedPreferences.getString("user_data");
    if (accessStr != null){
      accessToken = Token.fromJson(json.decode(accessStr));
    }
    if (refreshStr != null){
      refreshToken = Token.fromJson(json.decode(refreshStr));
    }
    if (user_data != null){
      userData = User.fromJson(jsonDecode(user_data));
    }
    print(accessToken);
    print(refreshToken);
    print(userData?.id ?? "");
  }


  Future<bool> checkLoginStatus() async{
    if (accessToken == null || refreshToken == null) {
      return false;
    }
    else{
      return await checkTokenStatus();
    }
  }

  Future<bool> checkTokenStatus() async{
    await setUp();
    DateTime acessTokenExpries = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(accessToken?.expires ?? "");
    if (DateTime.now().isBefore(acessTokenExpries)){
      return true;
    }
    else{
      DateTime refreshTokenExpries = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(accessToken?.expires ?? "");
      if (DateTime.now().isBefore(refreshTokenExpries)){
        return await getNewToken();
      }
      else{
        return false;
      }
    }
  }


  Future<bool> getNewToken(){
    return http.post(Uri.parse("https://sandbox.api.lettutor.com/auth/refresh-token"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'refreshToken': refreshToken?.token ?? "",
          'timezone': 7
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
      final access = body['tokens']['access'];
      final refresh = body['tokens']['refresh'];
      final Token accessToken = Token.fromJson(access);
      final Token refreshToken = Token.fromJson(refresh);
      saveInfo(accessToken, refreshToken);
      return true;
    });
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

  Future<bool> updateProfile(String phone, String name, String birthday){
    return http.put(Uri.parse("https://sandbox.api.lettutor.com/user/info"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${accessToken?.token}'
        },
        body: jsonEncode({
          'name': name,
          'phone': phone,
          'birthday': birthday,
        })
    ).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200) {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        // throw Exception("StatusCode:$statusCode, Error:${response.reasonPhrase}");
        return false;
      }

      const JsonDecoder _decoder = JsonDecoder();
      final body = _decoder.convert(jsonBody);
      final object = body['user'];
      userData = User.fromJson(object);
      saveInfo(accessToken!, refreshToken!);
      return true;
    });
  }
}