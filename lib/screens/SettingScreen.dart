import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracker/utils/constants.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: COLOR_RED,
      ),
      body: Container(
        alignment: Alignment.center,
        child: MaterialButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
          child: Text("Sign out"),
        ),
      ),
    );
  }
}
