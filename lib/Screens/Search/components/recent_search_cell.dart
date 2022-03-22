import 'package:flutter/material.dart';

import '../../../constant.dart';


class RecentSearchCell extends StatelessWidget {
  final String content;
  final VoidCallback press;
  const RecentSearchCell({
    Key? key,
    required this.content,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
          bottom: 10.0,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.5),
              spreadRadius: 0.0,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Text(
          content,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}