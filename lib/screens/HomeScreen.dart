import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracker/custom-designs/CustomAppbar.dart';
import 'package:tracker/utils/constants.dart';
import 'package:tracker/utils/widgets_functions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      appBar: CustomAppbar(
          titleName: "John Doe",
          jacketTemp: "24\u2103",
          ambientTemp: "20\u2103",
          battery: "85%"),
      body: Container(
        width: size.width,
        margin: EdgeInsets.only(right: 5, left: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView(
              children: listData.map((data) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  height: 100,
                  decoration: BoxDecoration(
                      color: COLOR_WHITE,
                      boxShadow: [
                        BoxShadow(
                            color: COLOR_SHADOW,
                            blurRadius: 14,
                            spreadRadius: 3,
                            offset: Offset(2, 2))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              data.iconData,
                              color: COLOR_RED,
                              size: 34,
                            ),
                          ],
                        ),
                        addHorizontalSpace(20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.title,
                              style: themeData.textTheme.headline3,
                            ),
                            Text(
                              data.subtitle,
                              style: themeData.textTheme.subtitle1,
                            ),
                          ],
                        ),
                        new Spacer(),
                        data.toggle != null
                            ? Switch(
                                value: data.toggle,
                                activeColor: COLOR_RED,
                                onChanged: (value) {},
                              )
                            : Icon(
                                Icons.gps_fixed,
                                color: COLOR_RED,
                                size: 34,
                              ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ))
          ],
        ),
      ),
    );
  }
}
