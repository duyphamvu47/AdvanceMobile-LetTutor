import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Welcome/welcome_screen.dart';
import 'package:lettutor/constant.dart';

import 'components/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log In',
      theme: ThemeData(
        // primaryColor: kPrimaryColor,
        // scaffoldBackgroundColor: Colors.white
          fontFamily: 'WorkSans',
      ),
      home: RootApp(),
    );
  }
}
