import 'package:flutter/material.dart';

class CourseFeatureRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final String content;

  const CourseFeatureRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 34,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  text: content,
                  style: TextStyle(
                      color: color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}