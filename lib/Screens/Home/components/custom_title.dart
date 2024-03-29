import 'package:flutter/material.dart';
import 'package:lettutor/constant.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
    this.route = '/404',
    this.extend = true,
    this.fontSize = 20.0,
  }) : super(key: key);

  final String title;
  final String route;
  final bool extend;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        (extend)
            ? GestureDetector(
          onTap: () {
            // Navigator.pushNamed(
            //   context,
            //   route,
            //   arguments: arg,
            // );
          },
          child: Text(
            'See More',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 15.0,
                fontWeight: FontWeight.w400),
          ),
        )
            : Container(),
      ],
    );
  }
}