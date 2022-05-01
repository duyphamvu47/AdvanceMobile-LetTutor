import 'package:flutter/material.dart';
import 'package:lettutor/Screens/ProfileSettings/components/body.dart';
import 'package:lettutor/ViewModel/ProfileViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ProfileViewModel.instance,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EditPage(),
      ),
    );
  }
}

