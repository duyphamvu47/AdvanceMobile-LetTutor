import 'package:flutter/material.dart';
import 'package:lettutor/ViewModel/ExploreViewModel.dart';
import 'package:lettutor/ViewModel/MyCoursesViewModel.dart';

import '../../../data/courses_json.dart';
import '../../CourseDetail/course_detail_screen.dart';
import '../../MyCourse/components/custom_my_course_cell.dart';


class ResultList extends StatelessWidget {
  const ResultList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(ExploredViewModel.instance.searchResult.length, (index) {
        var data = ExploredViewModel.instance.searchResult[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: GestureDetector(
            onTap: () {

            },
            child: CustomMyCoursesCard(
              image: data.imageUrl ?? "",
              title: data.name ?? "",
              onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context){
                        return CourseDetail(course: data);
                      }
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}