import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tracker/screens/RegisterScreen.dart';
import 'package:tracker/utils/constants.dart';
import 'package:tracker/utils/widgets_functions.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: COLOR_RED,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: Column(
              children: [
                addVerticalSpace(120),
                Text(
                  'Login',
                  style: TextStyle(
                    color: COLOR_WHITE,
                    fontFamily: 'Inter',
                    fontSize: 52,
                  ),
                ),
                addVerticalSpace(20),
                CardWidgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardWidgets extends StatefulWidget {
  @override
  _CardWidgetsState createState() => _CardWidgetsState();
}

class _CardWidgetsState extends State<CardWidgets> {
  String _email, _password;
  bool showButton = true, showLoading = false;

  Future<void> _loginUser() async {
    try {
      setState(() {
        showButton = false;
        showLoading = true;
      });
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      print("User $userCredential");
    } catch (e) {
      print("Error $e");
      setState(() {
        showButton = true;
        showLoading = false;
        Fluttertoast.showToast(
            msg: e.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width,
        height: 350,
        padding: new EdgeInsets.all(5),
        child: Column(children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: COLOR_WHITE,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      addVerticalSpace(30),
                      Center(
                        child: InkWell(
                          child: Text(
                            'Dont have an account? Signup',
                            style: themeData.textTheme.subtitle1,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          addVerticalSpace(30),
          Row(
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
                      _loginUser();
                    },
                    textColor: COLOR_RED,
                    color: COLOR_WHITE,
                    child: Text("Login"),
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
        ]),
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
