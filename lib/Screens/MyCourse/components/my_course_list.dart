import 'package:flutter/material.dart';
import 'package:lettutor/ViewModel/MyCoursesViewModel.dart';

import '../../../data/courses_json.dart';
import '../../CourseDetail/course_detail_screen.dart';
import 'custom_my_course_cell.dart';


class MyCourseList extends StatelessWidget {
  const MyCourseList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(MyCourseViewModel.instance.getCourseList().length, (index) {
        var data = MyCourseViewModel.instance.courseList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: GestureDetector(
            onTap: () {

            },
            child: CustomMyCoursesCard(
              image: data.imageUrl ?? "",
              title: data.name ?? "",
              onPress: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (context){
                //         return CourseDetail();
                //       }
                //   ),
                // );
              },
            ),
          ),
        );
      }),
    );
  }
}