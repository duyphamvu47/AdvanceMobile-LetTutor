import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/Screens/Login/login_screen.dart';
import 'package:lettutor/Screens/OTPScreen/otp_screen.dart';
import 'package:lettutor/Utils.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../ViewModel/ForgotPasswordViewModel.dart';
import '../../../components/rounded_button.dart';
import '../../Login/components/background.dart';
import '../../Login/components/rounded_input_field.dart';
import '../../Login/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant<ForgotPasswordViewModel>(
        builder: (BuildContext context, Widget? child, ForgotPasswordViewModel model){
          return Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "FORGOT PASSWORD",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03,),
                  SvgPicture.asset("assets/icons/login.svg",
                      height: size.height * 0.35
                  ),
                  SizedBox(height: size.height * 0.03,),
                  RoundedInputField(
                    hint: "Your email",
                    onChanged: (value){
                      model.ID = value;
                    },
                  ),
                  RoundedButton(
                      text: "Reset password",
                      press: (){
                          butttonPress(model, context);
                      }
                  ),
                  SizedBox(height: size.height * 0.03,),
                ],
              ),
            ),
          );
        }
    );
  }

  void butttonPress(ForgotPasswordViewModel model, BuildContext context) async{
    if (model.ID.isEmpty){
      Utils.showSnackBar(context, "Invalid email");
      return;
    }

    model.forgotPassword().then((value) {
      if (value){
        Utils.showSnackBar(context, "Please checkout your email inbox and follow the instruction to reset the password");
        Timer(Duration(seconds: 4), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {return LoginScreen();},),);
        });
      }
      else{
        Utils.showSnackBar(context, "Invalid email");
      }
    });
  }
}