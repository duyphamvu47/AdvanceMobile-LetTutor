import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Welcome/components/body.dart';
import 'package:lettutor/ViewModel/WelcomeViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(),);
  }

}