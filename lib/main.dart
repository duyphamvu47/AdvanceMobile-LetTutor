import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Welcome/welcome_screen.dart';
import 'package:lettutor/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/bottom_navigation.dart';

void main() {
  checkLoginStatus().then((value) => runApp(MyApp(isLogin: value)))
      .catchError((onError) => runApp(const MyApp(isLogin: false)));
  // runApp(const MyApp());
}

    Future<bool> checkLoginStatus() async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? ID = "";
      ID = preferences.getString("Login");
      if (ID != null){
        return true;
      }
      return false;
    }

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({Key? key, required this.isLogin,}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Log In',
        theme: ThemeData(
          // primaryColor: kPrimaryColor,
          // scaffoldBackgroundColor: Colors.white
            fontFamily: 'WorkSans',
        ),
        home: isLogin ?  RootApp() : WelcomeScreen(),
      );
  }

}
