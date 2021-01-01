import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tracker/utils/constants.dart';
import 'package:tracker/utils/widgets_functions.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email,
      _password,
      _confirmPassword,
      _name,
      _deviceID,
      _employeeID,
      _error;

  bool showButton = true, showLoading = false, isError = false;

  Future<void> _createUser() async {
    try {
      if (_email == null ||
          _password == null ||
          _confirmPassword == null ||
          _name == null ||
          _deviceID == null ||
          _employeeID == null) {
        setState(() {
          isError = true;
        });
      } else {
        setState(() {
          isError = false;
          showButton = false;
          showLoading = true;
        });
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        addUserDetails();
        if (userCredential != null) {
          Navigator.pop(context);
        }

        print("User $userCredential");
      }
    } catch (e) {
      setState(() {
        if (e != null) {
          isError = true;
          showButton = true;
          showLoading = false;
          _error = e.message;
          Fluttertoast.showToast(
              msg: e.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2);
        }
      });
      print("Error $e");
    }
  }

  Future<void> addUserDetails() async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.add({
        'name': _name,
        'email': _email,
        'device_id': _deviceID,
        'employee_id': _employeeID
      });
    } catch (e) {
      print("FireStore Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    String dropDownLanguage = "English";

    showAlertDialog(BuildContext context) {
      // Create button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // Create AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Error"),
        content: Text("Please check the fields"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      backgroundColor: COLOR_RED,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Signup",
                style: TextStyle(
                  color: COLOR_WHITE,
                  fontFamily: 'Inter',
                  fontSize: 48,
                ),
              ),
              addVerticalSpace(20),
              Center(
                child: Container(
                  width: size.width,
                  height: 600,
                  padding: new EdgeInsets.all(5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: COLOR_WHITE,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: themeData.textTheme.headline5,
                              ),
                              addVerticalSpace(5),
                              TextField(
                                onChanged: (value) {
                                  _name = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      )),
                                  hintText: 'John Doe ',
                                  fillColor: COLOR_GREY,
                                  filled: true,
                                ),
                              ),
                              addVerticalSpace(10),
                              Text(
                                'Email',
                                style: themeData.textTheme.headline5,
                              ),
                              addVerticalSpace(5),
                              TextField(
                                onChanged: (value) {
                                  _email = value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      )),
                                  hintText: 'Example@example.com',
                                  fillColor: COLOR_GREY,
                                  filled: true,
                                ),
                              ),
                              addVerticalSpace(10),
                              Text(
                                'Password',
                                style: themeData.textTheme.headline5,
                              ),
                              addVerticalSpace(5),
                              TextField(
                                onChanged: (value) {
                                  _password = value;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      )),
                                  hintText: '*******',
                                  fillColor: COLOR_GREY,
                                  filled: true,
                                ),
                              ),
                              addVerticalSpace(10),
                              Text(
                                'Confirm Password',
                                style: themeData.textTheme.headline5,
                              ),
                              addVerticalSpace(5),
                              TextField(
                                onChanged: (value) {
                                  _confirmPassword = value;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      )),
                                  hintText: '*******',
                                  fillColor: COLOR_GREY,
                                  filled: true,
                                ),
                              ),
                              addVerticalSpace(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Device ID',
                                          style: themeData.textTheme.headline5,
                                        ),
                                        addVerticalSpace(5),
                                        TextField(
                                          onChanged: (value) {
                                            _deviceID = value;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                            hintText: "Device ID",
                                            fillColor: COLOR_GREY,
                                            filled: true,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  addHorizontalSpace(10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Employee ID',
                                          style: themeData.textTheme.headline5,
                                        ),
                                        addVerticalSpace(5),
                                        TextField(
                                          onChanged: (value) {
                                            _employeeID = value;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                            hintText: "Employee ID",
                                            fillColor: COLOR_GREY,
                                            filled: true,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              addVerticalSpace(10),
                              Text(
                                'Language',
                                style: themeData.textTheme.headline5,
                              ),
                              addVerticalSpace(5),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                  width: size.width,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: COLOR_GREY,
                                      border: Border.all(
                                          width: 0, color: COLOR_GREY)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropDownLanguage,
                                      icon: Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(color: COLOR_RED),
                                      onChanged: (String value) {
                                        setState(() {
                                          dropDownLanguage = value;
                                        });
                                      },
                                      items: <String>[
                                        'English',
                                        'French',
                                        'German'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              addVerticalSpace(20),
                              Center(
                                child: InkWell(
                                  child: Text(
                                    'Already have an account? Login',
                                    style: themeData.textTheme.subtitle1,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Visibility(
                      visible: showButton,
                      child: ButtonTheme(
                        minWidth: size.width * 0.7,
                        height: 52,
                        child: RaisedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            _createUser();
                            if (isError) {
                              showAlertDialog(context);
                            }
                          },
                          textColor: COLOR_RED,
                          color: COLOR_WHITE,
                          child: Text("Signup"),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      child: loadingWidgets(),
                      visible: showLoading,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class loadingWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        addHorizontalSpace(5),
        Text("Registering...Please wait")
      ],
    );
  }
}
