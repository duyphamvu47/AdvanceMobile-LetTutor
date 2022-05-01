import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Manage/components/body.dart';
import 'package:lettutor/Service/Authentication.dart';
import '../../model/User.dart';
import 'components/header.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? user = Authentication().userData;
    return
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(
                name: user?.name ?? "",
                avatar: Image.asset(user?.avatar ?? "assets/images/user_profile.jpg"),
              ),
              Body(),
            ],
          ),
        ),
      );
    }
}