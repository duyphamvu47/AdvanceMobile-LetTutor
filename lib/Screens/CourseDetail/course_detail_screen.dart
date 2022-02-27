import 'dart:core';

import 'package:flutter/material.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'components/course_feature.dart';
import 'components/header.dart';
import 'components/section_title.dart';
import 'components/teacher_row.dart';

class CourseDetail extends StatelessWidget {
  final val;

  const CourseDetail({Key? key, this.val}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                          courseName: 'Advance Mobile',
                          courseIcon: Image.asset("assets/images/user_profile.jpg"),
                          description: "Beginer",
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        SectionTitle(
                          title: "The Course Includes",
                        ),
                        Container(
                          height: 300,
                          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                          padding: EdgeInsets.symmetric(
                              vertical: 24, horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(56),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 16)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CourseFeatureRow(
                                title: 'Schedule',
                                content: 'Every Tuesday 13:30',
                                color: Colors.deepPurpleAccent,
                                icon: Icons.videocam_outlined,
                              ),
                              CourseFeatureRow(
                                title: 'Duration',
                                content: '4 hrs lession',
                                color: Colors.cyan,
                                icon: Icons.bookmark_border_rounded,
                              ),
                              CourseFeatureRow(
                                title: 'Document',
                                content: 'Text book, exercise, lession video',
                                color: Colors.pinkAccent,
                                icon: Icons.folder_outlined,
                              ),
                            ],
                          ),
                        ),
                        SectionTitle(
                          title: "Teacher",
                        ),
                        TeacherRow(
                          name: 'Nguyen Van A',
                          avatar: Image.asset("assets/images/user_profile.jpg"),
                          specialize: "None",
                          onPress: (){
                            print("hi");
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RoundedButton(text: "Enroll", press: (){}),
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




