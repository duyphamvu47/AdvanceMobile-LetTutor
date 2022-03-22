import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/Screens/Login/components/already_have_an_account_check.dart';
import 'package:lettutor/Screens/Login/components/rounded_input_field.dart';
import 'package:lettutor/Screens/Login/components/rounded_password_field.dart';
import 'package:lettutor/Screens/Login/login_screen.dart';
import 'package:lettutor/Screens/Signup/components/social_icon.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:lettutor/constant.dart';

import '../../Signup//components/background.dart';
import 'or_divider.dart';

class Body extends StatelessWidget{
  const Body({Key? key}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hint: "Username",
              onChanged: (value){}
            ),
            RoundedPasswordField(
              onChanged: (value) {}
            ),
            RoundedButton(
              text: "SIGN UP",
              press: (){}
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAccountCheck(
              login: false,
              press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconPath: "assets/icons/facebook.svg",
                  press: (){
                    print("Hiii");
                  },
                ),
                SocialIcon(
                  iconPath: "assets/icons/google-plus.svg",
                  press: (){},
                ),
                SocialIcon(
                  iconPath: "assets/icons/twitter.svg",
                  press: (){},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



