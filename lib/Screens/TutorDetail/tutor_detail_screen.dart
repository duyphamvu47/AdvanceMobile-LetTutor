import 'dart:core';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/Screens/WaitingScreen/waiting_screen.dart';
import 'package:lettutor/components/bottom_navigation.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Service/Api.dart';
import '../../model/Course.dart';
import '../../model/Tutor.dart';
import '../CourseDetail/components/course_feature.dart';
import '../CourseDetail/components/header.dart';
import '../CourseDetail/components/section_title.dart';
import '../CourseDetail/components/teacher_row.dart';
import '../TutorSchedule/schedule_screen.dart';

class TutorDetail extends StatefulWidget {
  final Tutor tutor;
  @override
  _TutorDetail createState() => _TutorDetail();

  const TutorDetail({Key? key, required this.tutor}) : super(key: key);
}

class _TutorDetail extends State<TutorDetail>{
  bool isMyCourse = false;
  @override
  Widget build(BuildContext context) {
    // isMyCourse = checkIsMyCourse();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.deepPurple,
        child: Column(
          children: [
            Container(
              height: 88,
              padding: EdgeInsets.only(top: 16, left: 16),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 36,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(color: Colors.grey[200], fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: size.width,
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48),
                      topRight: Radius.circular(48),
                    )),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CourseDetailHeader(
                          courseName: widget.tutor.name?.toUpperCase() ?? "Course name",
                          courseIcon: widget.tutor.avatar != null ? Image.network(widget.tutor.avatar ?? "") : Image.asset("assets/images/user_profile.jpg"),
                          description: widget.tutor.specialties?.toUpperCase() ?? "",
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        SectionTitle(
                          title: "Tutor overview",
                        ),
                        Container(
                          height: 270.0,
                          // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                          padding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: CourseFeatureRow(
                                    color: Colors.deepPurpleAccent,
                                    content: widget.tutor.education?.toUpperCase() ?? "Education certificate",
                                    title: 'Education' ,
                                    icon: Icons.school_outlined
                                ),
                              ),
                              Flexible(
                                child: CourseFeatureRow(
                                    color: Colors.deepPurpleAccent,
                                    content:  widget.tutor.experience?.toUpperCase() ?? "Experience in education",
                                    title: 'Experience',
                                    icon: Icons.timer_outlined
                                ),
                              ),
                              Flexible(
                                child: CourseFeatureRow(
                                    color: Colors.deepPurpleAccent,
                                    content:  widget.tutor.education?.toUpperCase() ?? "All level",
                                    title: 'Target student',
                                    icon: Icons.person_outline_outlined
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RoundedButton(text: isMyCourse ? "Go to class" : "Enroll",
                                  press: () {
                                    // Go to waiting screen
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context){
                                            return SchedulePage(title: 'Schedule', ID: widget.tutor.userId ?? "",);
                                          }
                                      ),
                                    );
                                  }
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}


void btnClicked(BuildContext context){

}




