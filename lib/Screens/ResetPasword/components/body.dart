import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/Screens/Login/components/forgot_password_title.dart';
import 'package:lettutor/Screens/Login/components/rounded_input_field.dart';
import 'package:lettutor/Screens/Login/components/rounded_password_field.dart';
import 'package:lettutor/Screens/Login/login_screen.dart';
import 'package:lettutor/Screens/Signup/sign_up_screen.dart';
import 'package:lettutor/components/bottom_navigation.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:lettutor/constant.dart';

import '../../ForgotPassword/forgot_password.dart';
import '../../Welcome/components/background.dart';


class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "RESET PASSWORD",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03,),
            SvgPicture.asset("assets/icons/login.svg",
                height: size.height * 0.35
            ),
            SizedBox(height: size.height * 0.03,),
            RoundedPasswordField(
              onChanged: (value){},
              hint: "Your new password",
            ),
            RoundedPasswordField(
              onChanged: (value){},
              hint: "Your new password",
            ),
            RoundedButton(
                text: "DONE",
                press: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}








