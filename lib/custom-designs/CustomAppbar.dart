import 'package:flutter/material.dart';
import 'package:tracker/custom-designs/AppbarWidgets.dart';
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
                  Icon(
                    Icons.settings,
                    color: COLOR_WHITE,
                    size: 24.0,
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
                  AppbarWidgets(battery, "Battery", Icons.battery_std),
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
}
