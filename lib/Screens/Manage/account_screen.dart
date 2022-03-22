import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Manage/components/body.dart';
import 'components/header.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(
                name: 'Duy',
                avatar: Image.asset("assets/images/user_profile.jpg"),
              ),
              Body(),
            ],
          ),
        ),
      );
    }
}