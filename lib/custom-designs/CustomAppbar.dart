import 'package:flutter/material.dart';
import 'package:tracker/custom-designs/AppbarWidgets.dart';
import 'package:tracker/screens/SettingScreen.dart';
import 'package:tracker/utils/constants.dart';
import 'package:tracker/utils/widgets_functions.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 300.0;

  String titleName, jacketTemp, ambientTemp, battery;

  CustomAppbar(
      {this.titleName, this.jacketTemp, this.ambientTemp, this.battery})
      : assert(titleName != null),
        assert(jacketTemp != null),
        assert(ambientTemp != null),
        assert(battery != null);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      height: _preferredHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        color: COLOR_RED,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
      ),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Hi, $titleName",
                    style: TextStyle(
                      color: COLOR_WHITE,
                      fontFamily: 'Inter',
                      fontSize: 24,
                    ),
                  ),
                  IconButton(
                    icon: new Icon(Icons.settings),
                    color: COLOR_WHITE,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingScreen()),
                      );
                    },
                  )
                ],
              ),
              addVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppbarWidgets(jacketTemp, "Jacket Temp", Icons.ac_unit),
                  AppbarWidgets(ambientTemp, "Ambient Temp", Icons.hot_tub)
                ],
              ),
              addVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppbarWidgets(battery, "Battery", Icons.battery_std),
                  AppbarSOSWidgets(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_preferredHeight);

  AppbarSOSWidgets() {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: COLOR_LIGHT_WHITE,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Icon(
            Icons.error,
            color: COLOR_WHITE,
            size: 28.0,
          ),
        ),
        addHorizontalSpace(3),
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), side: BorderSide.none),
          color: COLOR_WHITE,
          textColor: COLOR_RED,
          child: Text(
            "SOS".toUpperCase(),
            style: TextStyle(fontSize: 14),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
