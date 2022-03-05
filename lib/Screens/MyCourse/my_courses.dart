import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../data/courses_json.dart';
import '../Home/components/custom_heading.dart';
import 'components/custom_my_course_cell.dart';
import 'components/my_course_header.dart';
import 'components/my_course_list.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  _MyCoursesPageState createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        children: [
          SizedBox(height: spacer - 1.0),
          MyCourseHeader(),
          SizedBox(height: spacer),
          MyCourseList(),
        ],
      ),
    );
  }
}