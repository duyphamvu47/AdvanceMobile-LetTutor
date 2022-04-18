import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Login/components/body.dart';
import 'package:lettutor/ViewModel/LoginViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: LoginViewModel.instance,
      child: Scaffold(
        body: Body(),
      ),
    );
  }
  
}

