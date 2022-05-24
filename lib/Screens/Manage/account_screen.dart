import 'package:flutter/material.dart';
import 'package:lettutor/Screens/Manage/components/body.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/ViewModel/ManagementPageViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../model/User.dart';
import 'components/header.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      ScopedModel(
        model: ManagementPageViewModel.instance,
        child: Scaffold(
          body: ScopedModelDescendant<ManagementPageViewModel>(
            builder: (BuildContext context, Widget? child, ManagementPageViewModel model){
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Header(
                      name: model.user?.name ?? "",
                      avatar: Image.asset(model.user?.avatar ?? "assets/images/user_profile.jpg"),
                    ),
                    Body(),
                  ],
                ),
              );
            }
          ),
        ),
      );
    }
}