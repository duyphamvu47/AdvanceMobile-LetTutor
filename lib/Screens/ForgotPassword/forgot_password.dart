import 'package:flutter/material.dart';
import 'package:lettutor/Screens/ForgotPassword/components/body.dart';
import 'package:lettutor/ViewModel/ForgotPasswordViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class ForgotPassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ForgotPasswordViewModel.instance,
      child: Scaffold(
        body: Body(),
      ),
    );
  }

}


