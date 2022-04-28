import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constant.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Shift {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  int? startTimestamp;
  int? endTimestamp;
  String? createdAt;
  bool? isBooked;
  List<ScheduleDetails>? scheduleDetails;

  Shift(
      {this.id,
        this.tutorId,
        this.startTime,
        this.endTime,
        this.startTimestamp,
        this.endTimestamp,
        this.createdAt,
        this.isBooked,
        this.scheduleDetails});

  Shift.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    createdAt = json['createdAt'];
    isBooked = json['isBooked'];
    if (json['scheduleDetails'] != null) {
      scheduleDetails = <ScheduleDetails>[];
      json['scheduleDetails'].forEach((v) {
        scheduleDetails!.add(new ScheduleDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tutorId'] = this.tutorId;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['startTimestamp'] = this.startTimestamp;
    data['endTimestamp'] = this.endTimestamp;
    data['createdAt'] = this.createdAt;
    data['isBooked'] = this.isBooked;
    if (this.scheduleDetails != null) {
      data['scheduleDetails'] =
          this.scheduleDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
  Appointment toAppointment(){
    final now = DateTime.now();
    TimeOfDay beginTime = toTime(this.startTime);
    TimeOfDay finishTime = toTime(this.endTime);
    DateTime startTime = DateTime(now.year, now.month, now.day, beginTime.hour, beginTime.minute);
    DateTime endTime = DateTime(now.year, now.month, now.day, finishTime.hour, finishTime.minute);
    DateTime startDate = DateTime.fromMillisecondsSinceEpoch(startTimestamp ?? 0);
    DateTime endDate = DateTime.fromMillisecondsSinceEpoch(endTimestamp ?? 0);
    String subject = (isBooked ?? false) ? "Full" : "Empty";
    Duration diff = startDate.difference(endDate);
    print("Begin: " + DateTime(startDate.year, startDate.month, startDate.day, startTime.hour, startTime.minute).toString());
    print("End: " + DateTime(endDate.year, endDate.month, endDate.day, endTime.hour, endTime.minute).toString());
    print("-----------");
    return  Appointment(
        startTime: startDate,
        endTime: startDate.add(Duration(minutes: diff.inMinutes)),
        subject: subject,
        color: kPrimaryColor,
        startTimeZone: '',
        endTimeZone: '',
        id: scheduleDetails?.first.id
    );

  }

  TimeOfDay toTime(String? dateTime){
    var splited = dateTime?.split(":");
    int hour = int.parse(splited?[0] ?? "0");
    int min = int.parse(splited?[1] ?? "0");
    return TimeOfDay(hour: hour, minute: min);
  }
}

class ScheduleDetails {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;

  ScheduleDetails(
      {this.startPeriodTimestamp,
        this.endPeriodTimestamp,
        this.id,
        this.scheduleId,
        this.startPeriod,
        this.endPeriod,
        this.createdAt,
        this.updatedAt,
        this.bookingInfo,
        this.isBooked});

  ScheduleDetails.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['bookingInfo'] != null) {
      bookingInfo = <BookingInfo>[];
      json['bookingInfo'].forEach((v) {
        bookingInfo!.add(new BookingInfo.fromJson(v));
      });
    }
    isBooked = json['isBooked'];
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
    if (this.bookingInfo != null) {
      data['bookingInfo'] = this.bookingInfo!.map((v) => v.toJson()).toList();
    }
    data['isBooked'] = this.isBooked;
    return data;
  }
}

class BookingInfo {
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? createdAt;
  String? updatedAt;
  bool? isDeleted;

  BookingInfo(
      {this.createdAtTimeStamp,
        this.updatedAtTimeStamp,
        this.id,
        this.userId,
        this.scheduleDetailId,
        this.tutorMeetingLink,
        this.studentMeetingLink,
        this.createdAt,
        this.updatedAt,
        this.isDeleted});

  BookingInfo.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
