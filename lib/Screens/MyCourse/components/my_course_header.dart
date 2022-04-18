import 'package:flutter/material.dart';
import 'package:lettutor/ViewModel/MyCoursesViewModel.dart';
import 'package:lettutor/constant.dart';

import '../../../data/courses_json.dart';
import '../../Home/components/custom_heading.dart';



class MyCourseHeader extends StatelessWidget {
  const MyCourseHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomHeading(
          title: 'My Courses',
          subTitle: '',
          color: kPrimaryColor,
        ),
        Text(
          MyCourseViewModel.instance.courseList.length.toString() + ' Courses',
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}