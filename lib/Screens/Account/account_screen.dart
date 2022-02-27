import 'package:flutter/material.dart';
import 'package:lettutor/components/circle_image.dart';

import '../../constant.dart';
import '../Home/components/clipper.dart';
import '../Home/components/custom_heading.dart';
import 'components/setting_item.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({ Key? key }) : super(key: key);

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipPath(
                  clipper: BottomClipper(),
                  child: Container(
                      width: size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                      )),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: appPadding, right: appPadding),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.05),
                      //heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomHeading(
                            title: 'Manage',
                            subTitle: '',
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: spacer),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: size.height * 0.1),
                    CircleImage(
                      avatar: Image.asset("assets/images/user_profile.jpg"),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Duy",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            getBody(),
          ],
        ),
      );
  }

  Widget getBody() {
    Size size = MediaQuery.of(context).size;
    return
      SingleChildScrollView(
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

                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Divider(height: 0, color: Colors.grey.withOpacity(0.8),),
                    ),
                    SettingItem(title: "Schedule",
                      leadingIcon: "assets/icons/schedule.svg",
                      bgIconColor: Color(0xFFa2e1a6),
                      onTap: (){

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