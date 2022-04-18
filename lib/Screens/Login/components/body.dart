import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/Screens/Login/components/forgot_password_title.dart';
import 'package:lettutor/Screens/Login/components/rounded_input_field.dart';
import 'package:lettutor/Screens/Login/components/rounded_password_field.dart';
import 'package:lettutor/Screens/Signup/sign_up_screen.dart';
import 'package:lettutor/ViewModel/LoginViewModel.dart';
import 'package:lettutor/components/bottom_navigation.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:lettutor/constant.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../Utils.dart';
import '../../ForgotPassword/forgot_password.dart';
import '../../Welcome/components/background.dart';
import 'already_have_an_account_check.dart';


class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant<LoginViewModel>(
      builder: (BuildContext context, Widget? child, LoginViewModel model){
        return Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03,),
                SvgPicture.asset("assets/icons/login.svg",
                    height: size.height * 0.35
                ),
                SizedBox(height: size.height * 0.03,),
                RoundedInputField(
                  hint: "Username",
                  onChanged: (value){
                    model.ID = value;
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value){
                    model.password = value;
                  },
                ),
                RoundedButton(
                    text: "LOGIN",
                    press: (){
                      loginBtnPress(context, model);
                    }
                ),
                SizedBox(height: size.height * 0.03,),
                ForgotPasswordTitle(
                    press: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ForgotPassword();
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
    );
  }

  void loginFail(BuildContext context) {

    Utils.showSnackBar(context, 'Wrong username or password');
  }

  void loginBtnPress(BuildContext context, LoginViewModel model) async{
    var result = await model.authenticate();
    if (result){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return RootApp();
          },
        ),
      );
    }
    else{
      loginFail(context);
    }
  }

}








