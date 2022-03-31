import 'package:flutter/material.dart';

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
      children: List.generate(MyCoursesJson.length, (index) {
        var data = MyCoursesJson[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: GestureDetector(
            onTap: () {

            },
            child: CustomMyCoursesCard(
              image: data['image'],
              title: data['title'],
              instructor: data['user_name'],
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