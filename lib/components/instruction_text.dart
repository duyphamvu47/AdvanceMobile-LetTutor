import 'package:flutter/material.dart';

import '../../../constant.dart';

class InstructionText extends StatelessWidget {
  final String text_1;
  final String text_2;
  final Color textColor;
  final VoidCallback  press;
  const InstructionText({
    Key? key,
    required this.press,
    required this.text_1,
    this.text_2 = "",
    this.textColor = kPrimaryColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text_1,
          style: TextStyle(color: textColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            text_2,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}