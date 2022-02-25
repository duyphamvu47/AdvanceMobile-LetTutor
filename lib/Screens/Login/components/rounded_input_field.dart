import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Login/components/text_field_container.dart';

import '../../../constant.dart';

class RounderInputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RounderInputField({
    Key? key,
    required this.hint,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}