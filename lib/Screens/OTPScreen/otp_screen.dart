import 'package:flutter/material.dart';
import 'package:lettutor/Screens/OTPScreen/components/body.dart';

class OTPScreen extends StatelessWidget{
  final String email;
  const OTPScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        email: email,
      ),
    );
  }

}