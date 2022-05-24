import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../constant.dart';

class MyAppointment {
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  // Null? studentRequest;
  // Null? tutorReview;
  // Null? scoreByTutor;
  String? createdAt;
  String? updatedAt;
  // Null? recordUrl;
  bool? isDeleted;
  ScheduleDetailInfo? scheduleDetailInfo;
  bool? showRecordUrl;
  // List<Null>? studentMaterials;

  MyAppointment(
      {this.createdAtTimeStamp,
        this.updatedAtTimeStamp,
        this.id,
        this.userId,
        this.scheduleDetailId,
        this.tutorMeetingLink,
        this.studentMeetingLink,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
        this.scheduleDetailInfo,
        this.showRecordUrl,
      });

  MyAppointment.fromJson(Map<String, dynamic> json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    studentMeetingLink = json['studentMeetingLink'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDeleted = json['isDeleted'];
    scheduleDetailInfo = json['scheduleDetailInfo'] != null
        ? new ScheduleDetailInfo.fromJson(json['scheduleDetailInfo'])
        : null;
    showRecordUrl = json['showRecordUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAtTimeStamp'] = this.createdAtTimeStamp;
    data['updatedAtTimeStamp'] = this.updatedAtTimeStamp;
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['scheduleDetailId'] = this.scheduleDetailId;
    data['tutorMeetingLink'] = this.tutorMeetingLink;
    data['studentMeetingLink'] = this.studentMeetingLink;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isDeleted'] = this.isDeleted;
    if (this.scheduleDetailInfo != null) {
      data['scheduleDetailInfo'] = this.scheduleDetailInfo!.toJson();
    }
    data['showRecordUrl'] = this.showRecordUrl;
    return data;
  }

  Appointment toAppointment(){
    DateTime startDate = DateTime.fromMillisecondsSinceEpoch(this.scheduleDetailInfo?.startPeriodTimestamp ?? 0);
    DateTime endDate = DateTime.fromMillisecondsSinceEpoch(this.scheduleDetailInfo?.endPeriodTimestamp ?? 0);
    Duration diff = startDate.difference(endDate);
    return  Appointment(
        startTime: startDate,
        endTime: startDate.add(Duration(minutes: diff.inMinutes)),
        subject: "Join",
        color: kPrimaryColor,
        startTimeZone: '',
        endTimeZone: '',
        id: scheduleDetailInfo?.id
    );

  }
}

class ScheduleDetailInfo {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  ScheduleInfo? scheduleInfo;

  ScheduleDetailInfo(
      {this.startPeriodTimestamp,
        this.endPeriodTimestamp,
        this.id,
        this.scheduleId,
        this.startPeriod,
        this.endPeriod,
        this.createdAt,
        this.updatedAt,
        this.scheduleInfo});

  ScheduleDetailInfo.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    scheduleInfo = json['scheduleInfo'] != null
        ? new ScheduleInfo.fromJson(json['scheduleInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startPeriodTimestamp'] = this.startPeriodTimestamp;
    data['endPeriodTimestamp'] = this.endPeriodTimestamp;
    data['id'] = this.id;
    data['scheduleId'] = this.scheduleId;
    data['startPeriod'] = this.startPeriod;
    data['endPeriod'] = this.endPeriod;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.scheduleInfo != null) {
      data['scheduleInfo'] = this.scheduleInfo!.toJson();
    }
    return data;
  }
}

class ScheduleInfo {
  String? date;
  int? startTimestamp;
  int? endTimestamp;
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;

  ScheduleInfo(
      {this.date,
        this.startTimestamp,
        this.endTimestamp,
        this.id,
        this.tutorId,
        this.startTime,
        this.endTime,
        this.createdAt,
        this.updatedAt});

  ScheduleInfo.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['startTimestamp'] = this.startTimestamp;
    data['endTimestamp'] = this.endTimestamp;
    data['id'] = this.id;
    data['tutorId'] = this.tutorId;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
