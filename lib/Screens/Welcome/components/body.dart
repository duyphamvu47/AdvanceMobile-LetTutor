import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/Screens/Home/home_screen.dart';
import 'package:lettutor/Screens/Login/login_screen.dart';
import 'package:lettutor/Screens/Signup/sign_up_screen.dart';
import 'package:lettutor/ViewModel/WelcomeViewModel.dart';
import 'package:lettutor/components/bottom_navigation.dart';
import 'package:lettutor/constant.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../../Service/Authentication.dart';
import '../../../components/rounded_button.dart';
import 'background.dart';

Widget getBody(BuildContext context){
  Size size = MediaQuery.of(context).size;
  return ScopedModelDescendant<WelcomeViewModel>(
      builder: (BuildContext context, Widget? child, WelcomeViewModel model){
        return Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Hi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.05),
                SvgPicture.asset(
                  "assets/icons/chat.svg",
                  height: size.height * 0.5,
                ),
                SizedBox(height: size.height * 0.05),
                RoundedButton(
                  text: "LOGIN",
                  press: () {
                    loginButtonPress(context, model);
                  },
                ),
                RoundedButton(
                  text: "SIGN UP",
                  color: kPrimaryLightColor,
                  textColor: Colors.black,
                  press: () {
                  },
                )
              ],
            ),
          ),
        );
      }
  );
}


  void loginButtonPress(BuildContext context, WelcomeViewModel model) async {
    Authentication.instance.checkLoginStatus().then((value) {
      if (!value){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      }
      else{
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RootApp();
            },
          ),
        );
      }
    });

  }




