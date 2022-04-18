import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Signup/components/body.dart';
import 'package:lettutor/ViewModel/SignUpViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class SingUpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: SignUpViewModel.instance,
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}

