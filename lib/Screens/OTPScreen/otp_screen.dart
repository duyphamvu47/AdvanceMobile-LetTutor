import 'package:flutter/material.dart';
import 'package:lettutor/Screens/OTPScreen/components/body.dart';
import 'package:lettutor/ViewModel/OTPScreenViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class OTPScreen extends StatelessWidget{
  final String email;
  const OTPScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: OTPScreenViewModel.instance,
      child: Scaffold(
        body: Body(
          email: email,
        ),
      ),
    );
  }

}