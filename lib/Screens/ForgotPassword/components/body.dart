import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              onChanged: (value){},
            ),
            RoundedButton(
                text: "Reset password",
                press: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return RootApp();
                  //     },
                  //   ),
                  // );
                }
            ),
            SizedBox(height: size.height * 0.03,),
          ],
        ),
      ),
    );
  }
}