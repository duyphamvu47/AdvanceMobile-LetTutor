import 'package:flutter/material.dart';
import 'package:lettutor/Screens/ResetPasword/components/body.dart';
import 'package:lettutor/ViewModel/ResetPasswordViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class ResetPasswordScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ResetPasswordViewModel.instance,
      child: Scaffold(
        body: Body(),
      ),
    );
  }

}