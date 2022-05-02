import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Manage/components/setting_item.dart';
import 'package:lettutor/Screens/ProfileSettings/profile_settings_screen.dart';
import 'package:lettutor/Screens/ResetPasword/reset_password_screen.dart';
import 'package:lettutor/Screens/Settings/settings_screen.dart';
import 'package:lettutor/Screens/Welcome/welcome_screen.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'header.dart';

import '../../../constant.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
                children: [
                  SettingItem(title: "Profile",
                    leadingIcon: "assets/icons/profile.svg",
                    bgIconColor: Color(0xFF509BE4),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileSettingsPage();
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Divider(height: 0, color: Colors.grey.withOpacity(0.8),),
                  ),
                  SettingItem(title: "Password",
                    leadingIcon: "assets/icons/password.svg",
                    bgIconColor: Color(0xFFa2e1a6),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResetPasswordScreen();
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Divider(height: 0, color: Colors.grey.withOpacity(0.8),),
                  ),
                  SettingItem(title: "Document",
                    leadingIcon: "assets/icons/document.svg",
                    bgIconColor: kPrimaryColor,
                    onTap: (){

                    },
                  ),
                ]
            ),
          ),

          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
                children: [
                  SettingItem(title: "Settings",
                    leadingIcon: "assets/icons/setting.svg",
                    bgIconColor: Color(0xFFf5ba92),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SettingsScreen();
                          },
                        ),
                      );
                    },
                  ),
                ]
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
                children: [
                  SettingItem(title: "Log Out",
                    leadingIcon: "assets/icons/logout.svg",
                    bgIconColor: Color(0xFFf5bde8),
                    onTap: (){
                      logOut().then((value) =>  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WelcomeScreen();
                          },
                        ),
                      )
                      );
                    },
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> logOut() async{
  return await Authentication().logOut();
}