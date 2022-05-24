import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/Screens/Login/components/forgot_password_title.dart';
import 'package:lettutor/Screens/Login/components/rounded_input_field.dart';
import 'package:lettutor/Screens/Login/components/rounded_password_field.dart';
import 'package:lettutor/Screens/Login/login_screen.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/Utils.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:lettutor/ViewModel/ResetPasswordViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../ForgotPassword/forgot_password.dart';
import '../../Welcome/components/background.dart';


class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant<ResetPasswordViewModel>(
        builder: (BuildContext context, Widget? child, ResetPasswordViewModel model){
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
                onChanged: (value){
                  model.password = value;
                },
                hint: "Your current password",
              ),
              RoundedPasswordField(
                onChanged: (value){
                  model.password_ = value;
                },
                hint: "Your new password",
              ),
              RoundedButton(
                  text: "DONE",
                  press: (){
                    buttonPress(model, context);
                  }
              ),
            ],
          ),
        ),
      );
      }
    );
  }

  void buttonPress(ResetPasswordViewModel model, BuildContext context) async{


    if (model.password_ == model.password){
      Utils.showSnackBar(context, "New password must different from old password");
      return;
    }
    else{
      model.changePassword().then((value) {
        if (value){
          Utils.showSnackBar(context, "Done! You'll be navigate to the Login Screen");
          Authentication.instance.logOut();
          Timer(Duration(seconds: 4), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {return LoginScreen();},),);
          });
        }
        else{
          Utils.showSnackBar(context, "Check your password !");
        }
      });
    }
  }
}








