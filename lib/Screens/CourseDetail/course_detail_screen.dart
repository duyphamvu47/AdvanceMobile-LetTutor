import 'dart:core';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/Course.dart';
import 'components/course_feature.dart';
import 'components/header.dart';
import 'components/section_title.dart';
import 'components/teacher_row.dart';

class CourseDetail extends StatelessWidget {
  final Course course;

  const CourseDetail({Key? key, required this.course}) : super(key: key);
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
                          courseName: course.name ?? "Course name",
                          courseIcon: course.imageUrl != null ? Image.network(course.imageUrl ?? "") : Image.asset("assets/images/user_profile.jpg"),
                          description: course.description ?? "",
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        SectionTitle(
                          title: "The Course Includes",
                        ),
                        Container(
                          height: 100.0 * (getTopics().length),
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
                            children:
                              List.generate(getTopics().length, (index) {
                                var topic = course.topics![index];
                                return Flexible(
                                  child: CourseFeatureRow(
                                    title: topic.name ?? "",
                                    content: "With document",
                                    color: Colors.deepPurpleAccent,
                                    icon: Icons.videocam_outlined,
                                  ),
                                );
                              }
                              ),
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
                              RoundedButton(text: "Enroll", press: () => enrollCourse()),
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


  List<Topics> getTopics(){
    return course.topics?.where((element) => (element.name?.length ?? 0) <= 15).toList() ?? [];
  }

  void enrollCourse() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> myCourse = [];
    myCourse = sharedPreferences.getStringList("MyCourse") ?? [];
    if (!myCourse.contains(course.id ?? "")){
      myCourse.add(course.id ?? "");
      sharedPreferences.setStringList("MyCourse", myCourse);
    }
  }
}




