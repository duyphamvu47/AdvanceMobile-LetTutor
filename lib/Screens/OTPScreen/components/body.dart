import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/Screens/ResetPasword/reset_password_screen.dart';
import 'package:lettutor/Utils.dart';
import 'package:lettutor/components/instruction_text.dart';
import 'package:lettutor/ViewModel/OTPScreenViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../../components/rounded_button.dart';
import '../../Login/components/background.dart';
import '../../Login/components/rounded_input_field.dart';

class Body extends StatelessWidget {
  final String email;
  const Body({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant<OTPScreenViewModel>(
        builder: (BuildContext context, Widget? child, OTPScreenViewModel model){
          return Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "OTP CONFIRMATION",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.1,),
                  InstructionText(
                    press: (){},
                    text_2: "We have sent you an verification code to your email",
                  ),
                  SizedBox(height: size.height * 0.03,),
                  RoundedInputField(
                    hint: "Verification code",
                    onChanged: (value){
                      model.otpFromUser = value;
                    },
                  ),
                  RoundedButton(
                      text: "DONE",
                      press: (){
                        if (model.checkOTP()){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ResetPasswordScreen();
                              },
                            ),
                          );
                        }
                        else{
                          Utils.showSnackBar(context, "Wrong verification code");
                        }
                      }
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}