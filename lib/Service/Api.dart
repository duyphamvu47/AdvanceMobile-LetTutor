import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/model/Course.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Tutor.dart';
import 'package:http/http.dart' as http;

class API {
  static final API instance = API._internal();
  static String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjYjllN2RlYi0zMzgyLTQ4ZGItYjA3Yy05MGFjZjUyZjU0MWMiLCJpYXQiOjE2NDg3MTM5MDksImV4cCI6MTY0ODgwMDMwOSwidHlwZSI6ImFjY2VzcyJ9.O6BMoMTsw895uk0OhgIlMC9Y-cREg3CeR1CpCqRZJNw";

  String ID = "";
  String password = "";

  factory API() {
    return instance;
  }

  API._internal() {
  }

  Future<List<Tutor>> fetchTutor() {
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
      return tutors.map((contactRaw) => Tutor.fromJson(contactRaw)).toList();
    });
  }

  Future<List<Course>> fetchCourse() {
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
      return course.map((contactRaw) => Course.fromJson(contactRaw)).toList();
    });
  }
}