import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/Screens/Login/components/rounded_input_field.dart';
import 'package:lettutor/Screens/Login/components/rounded_password_field.dart';
import 'package:lettutor/components/rounded_button.dart';
import 'package:lettutor/constant.dart';

import '../../Welcome/components/background.dart';
import 'already_have_an_account_check.dart';


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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03,),
            SvgPicture.asset("assets/icons/login.svg",
              height: size.height * 0.35
            ),
            SizedBox(height: size.height * 0.03,),
            RounderInputField(
              hint: "Username",
              onChanged: (value){},
            ),
            RoundedPasswordField(
              onChanged: (value){},
            ),
            RoundedButton(
                text: "LOGIN",
                press: (){}
            ),
            SizedBox(height: size.height * 0.03,),
            AlreadyHaveAccountCheck(
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}








