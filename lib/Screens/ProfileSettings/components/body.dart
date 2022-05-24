import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/Screens/ProfileSettings/components/profile_image_with_edit_button.dart';
import 'package:lettutor/Service/Api.dart';
import 'package:lettutor/Service/Authentication.dart';
import 'package:lettutor/Utils.dart';
import 'package:lettutor/ViewModel/ManagementPageViewModel.dart';
import 'package:lettutor/ViewModel/ProfileViewModel.dart';
import 'package:lettutor/constant.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Settings/settings_screen.dart';


class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProfileViewModel>(
        builder: (BuildContext context, Widget? child, ProfileViewModel model){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 1,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: kPrimaryColor,
                ),
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
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
              ],
            ),
            body: Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ProfileImageWithEditButton(image: Image.asset(Authentication.instance.userData?.avatar ?? "assets/images/user_profile.jpg")),
                    SizedBox(
                      height: 35,
                    ),
                    buildTextField(
                        "Full Name",
                        "Full Name",
                        model.name,
                        false,
                        (value) {
                          model.name = value;
                        }
                    ),
                    buildTextField("Phone", "Phone number", model.phone, false, (value) {model.phone = value;}),
                    buildTextField("Birthday", "yyyy-MM-dd", model.birthday, false, (value) {model.birthday = value;}),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlineButton(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop(context);
                          },
                          child: Text("CANCEL",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        RaisedButton(
                          onPressed: () {
                            saveBtnClicked(context, model);
                          },
                          color: kPrimaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget buildTextField(String labelText, String hintText, String defaultValue, bool isPasswordTextField, ValueChanged<String> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField (
        onChanged: onChanged,
        initialValue: defaultValue,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            ) : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle:
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              ),
            ),
      ),
    );
  }
}


void saveBtnClicked(BuildContext context, ProfileViewModel model) async{
  try {
    var temp = DateFormat('yyyy-MM-dd').parseStrict(model.birthday);
    if (temp == null) {
      Utils.showSnackBar(context, "Wrong date format");
      return;
    }
  } on Exception catch (_) {
    Utils.showSnackBar(context, "Wrong date format");
    return;
  }
  model.updateProfile().then((value) {
    if (value){
      Authentication.instance.userData?.name = model.name;
      ManagementPageViewModel.instance.reloadData();
      Navigator.of(context, rootNavigator: true).pop(context);
    }
    else{
      Utils.showSnackBar(context, "Fail to update profile");
    }
  });
}

