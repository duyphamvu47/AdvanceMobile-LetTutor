import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Welcome/components/body.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/ViewModel/WelcomeViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreen createState() => _WelcomeScreen();

}

class _WelcomeScreen extends State<WelcomeScreen>{

  @override
  void initState() {
    Authentication.instance.setUp();
    Authentication.instance.checkLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: WelcomeViewModel.instance,
      child: SafeArea(
          child: Scaffold(
            body: getBody(context),
          )
      ),
    );
  }
}