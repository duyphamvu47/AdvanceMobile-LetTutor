import 'dart:core';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lettutor/Screens/WaitingScreen/waiting_screen.dart';
import 'package:lettutor/components/bottom_navigation.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Service/Api.dart';
import '../../model/Course.dart';
import 'components/course_feature.dart';
import 'components/header.dart';
import 'components/section_title.dart';
import 'components/teacher_row.dart';

class CourseDetail extends StatefulWidget {
  final Course course;
  @override
  _CourseDetail createState() => _CourseDetail();

  const CourseDetail({Key? key, required this.course}) : super(key: key);
}

class _CourseDetail extends State<CourseDetail>{
  bool isMyCourse = false;
  @override
  Widget build(BuildContext context) {
    isMyCourse = checkIsMyCourse();
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
                          courseName: widget.course.name ?? "Course name",
                          courseIcon: widget.course.imageUrl != null ? Image.network(widget.course.imageUrl ?? "") : Image.asset("assets/images/user_profile.jpg"),
                          description: widget.course.description ?? "",
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
                              var topic = widget.course.topics![index];
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
                              RoundedButton(text: isMyCourse ? "Go to class" : "Enroll", press: () {
                                if (isMyCourse){
                                  // Go to waiting screen
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context){
                                          return WaitingScreen();
                                        }
                                    ),
                                  );
                                } else{
                                  enrollCourse().then((value) {
                                  });
                                }
                              }),
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
    return widget.course.topics?.where((element) => (element.name?.length ?? 0) <= 15).toList() ?? [];
  }

  Future<void> enrollCourse() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> myCourse = [];
    myCourse = sharedPreferences.getStringList("MyCourse") ?? [];
    if (!myCourse.contains(widget.course.id ?? "")){
      myCourse.add(widget.course.id ?? "");
      sharedPreferences.setStringList("MyCourse", myCourse);
      // await API.instance.fetchMyCourse();
      // await API.instance.fetchRelatedCourse();
      Navigator.pop(context,
          MaterialPageRoute(builder: (context) => RootApp()));
    }
  }

  bool checkIsMyCourse(){
    List<String?> myCourse = API.myCourse.map((e) => e.id).toList();
    isMyCourse = myCourse.contains(widget.course.id);
    return isMyCourse;
  }
}




