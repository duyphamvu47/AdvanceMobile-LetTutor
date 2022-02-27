import 'package:flutter/material.dart';

import '../../../components/circle_image.dart';

class TeacherRow extends StatelessWidget {
  final String name;
  final Image avatar;
  final String specialize;
  final VoidCallback onPress;
  const TeacherRow({
    Key? key,
    required this.name,
    required this.avatar,
    this.specialize = "",
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(
          vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                color: Colors.black.withOpacity(0.1),
                blurRadius: 16)
          ]),
      child: GestureDetector(
        onTap: onPress,
        child: Row(
          children: [
            CircleImage(avatar: avatar),
            SizedBox(
              width: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  specialize,
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 15),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_right_alt_rounded,
              color: Colors.deepPurple,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}