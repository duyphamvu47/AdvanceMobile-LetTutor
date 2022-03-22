import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _dark;
  bool notification = true;
  bool newsletter = false;
  bool offer = true;
  bool update = false;

  @override
  void initState() {
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            'Manage',
            style: TextStyle(color: kPrimaryColor),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.moon),
              onPressed: () {
                setState(() {
                  _dark = !_dark;
                });
              },
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Text(
                  "Notification Settings",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: kPrimaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: notification,
                    title: Text("Received notification"),
                    onChanged: (bool val) {
                      setState(() {
                        notification = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: kPrimaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: newsletter,
                    title: Text("Received newsletter"),
                    onChanged: (bool value){
                      setState(() {
                        newsletter = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: kPrimaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: offer,
                    title: Text("Received Offer Notification"),
                    onChanged: (val) {
                      setState(() {
                        offer = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: kPrimaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: update,
                    title: Text("Received App Updates"),
                    onChanged: (value) {
                      setState(() {
                        update = value;
                      });
                    },
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}