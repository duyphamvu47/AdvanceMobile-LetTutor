import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/model/Course.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Schedule.dart';
import '../model/Tutor.dart';
import 'package:http/http.dart' as http;

class API {
  static final API instance = API._internal();
  static String token = "";

  static List<Course> courseList = [];
  static List<Course> myCourse = [];
  static List<Tutor> tutorList = [];
  String ID = "";
  String password = "";

  factory API() {
    return instance;
  }

  API._internal() {
  }

  Future<List<Tutor>> fetchTutor() {
    String? Token = Authentication.instance.accessToken?.token;
    if (Token != null){
      token = Token;
    }
    return http.post(Uri.parse("https://sandbox.api.lettutor.com/tutor/search"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }).then((http.Response response) {
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
      final tutorContainer = _decoder.convert(jsonBody);
      final List tutors = tutorContainer['rows'];
      tutorList = tutors.map((contactRaw) => Tutor.fromJson(contactRaw)).toList();
      return tutorList;
    });
  }

  Future<List<Course>> fetchCourse() {
    String? Token = Authentication.instance.accessToken?.token;
    if (Token != null){
      token = Token;
    }
    return http.get(Uri.parse("https://sandbox.api.lettutor.com/course"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }).then((http.Response response) {
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
      final tutorContainer = _decoder.convert(jsonBody);
      final List course = tutorContainer['data']['rows'];
      courseList = course.map((contactRaw) => Course.fromJson(contactRaw)).toList();
      return courseList;
    });
  }


  Future<List<Course>> fetchMyCourse() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> myCourseStr = [];
    myCourseStr = sharedPreferences.getStringList("MyCourse") ?? [];

    myCourse = courseList.where((element) => myCourseStr.contains(element.id ?? "")).toList();
    return myCourse;
  }

  Future<List<Course>> fetchRelatedCourse() async {
    await fetchCourse();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> myCourseStr = [];
    myCourseStr = sharedPreferences.getStringList("MyCourse") ?? [];

    return courseList.where((element) => !myCourseStr.contains(element.id ?? "")).toList();
  }

  Future<List<Shift>> fetchTutorSchedule(String ID){
    String? Token = Authentication.instance.accessToken?.token;
    if (Token != null && token != Token){
      token = Token;
    }
    return http.post(Uri.parse("https://sandbox.api.lettutor.com/schedule"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'tutorId': ID
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
      final List schedule = body['data'];
      schedule.forEach((element) {print(element);});
      final List<Shift> shifts = schedule.map((e) => Shift.fromJson(e)).toList();
      return shifts;
    });
  }

  Future<bool> bookClass(String ID){
    String? Token = Authentication.instance.accessToken?.token;
    if (Token != null && token != Token){
      token = Token;
    }
    return http.post(Uri.parse("https://sandbox.api.lettutor.com/booking"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'scheduleDetailIds': [ID]
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

      return true;
    });
  }

  Future<List<Shift>> fetchMySchedule(int page){
    String? Token = Authentication.instance.accessToken?.token;
    if (Token != null && token != Token){
      token = Token;
    }
    return http.get(Uri.parse("https://sandbox.api.lettutor.com/booking/list/student?page=$page&perPage=10&dateTimeLte=1639805436469&orderBy=meeting&sortBy=desc"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
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
      final List schedule = body['data']['rows'];
      final List<Shift> shifts = schedule.map((e) => Shift.fromJson(e)).toList();
      return shifts;
    });
  }

  Future<bool> deleteClass(String ID){
    String? Token = Authentication.instance.accessToken?.token;
    if (Token != null && token != Token){
      token = Token;
    }
    return http.delete(Uri.parse("https://sandbox.api.lettutor.com/booking"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'scheduleDetailIds': [ID]
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

      return true;
    });
  }


}