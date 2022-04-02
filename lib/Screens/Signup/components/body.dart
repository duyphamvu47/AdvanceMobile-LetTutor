import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/Screens/Login/components/already_have_an_account_check.dart';
import 'package:lettutor/Screens/Login/components/rounded_input_field.dart';
import 'package:lettutor/Screens/Login/components/rounded_password_field.dart';
import 'package:lettutor/Screens/Login/login_screen.dart';
import 'package:lettutor/Screens/Signup/components/social_icon.dart';
import 'package:lettutor/Utils.dart';
import 'package:lettutor/ViewModel/SignUpViewModel.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:lettutor/constant.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Signup//components/background.dart';
import 'or_divider.dart';

class Body extends StatelessWidget{
  const Body({Key? key}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant<SignUpViewModel>(
      builder: (BuildContext context, Widget? child, SignUpViewModel model){
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
                    onChanged: (value){
                      model.ID = value;
                    }
                ),
                RoundedPasswordField(
                    onChanged: (value) {
                      model.password = value;
                    }
                ),
                RoundedPasswordField(
                    onChanged: (value) {
                      model.password_ = value;
                    }
                ),
                RoundedButton(
                    text: "SIGN UP",
                    press: (){
                      if (model.ID.isEmpty || model.password.isEmpty || model.password_.isEmpty){
                        Utils.showSnackBar(context, "Empty username or password");
                      }
                      else{
                        handleSignUpResult(context, model.signUp());
                      }
                    }
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
    );
  }


  void handleSignUpResult(BuildContext context, SignUpResult result){
    if (result == SignUpResult.existed){
      Utils.showSnackBar(context, "Username already existed");
    }
    else if (result == SignUpResult.notMatch){
      Utils.showSnackBar(context, "Passwords are not match");
    }
    else if (result == SignUpResult.success){
      Utils.showSnackBar(context, "Sign up success, please log in");
      Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
    }
  }
}



