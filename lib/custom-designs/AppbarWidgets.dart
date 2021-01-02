import 'package:flutter/material.dart';
import 'package:tracker/utils/constants.dart';
import 'package:tracker/utils/widgets_functions.dart';

class AppbarWidgets extends StatelessWidget {
  String _readings, _subtitle;
  IconData icon;

  AppbarWidgets(this._readings, this._subtitle, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 55,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: COLOR_LIGHT_WHITE,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Icon(
              icon,
              color: COLOR_WHITE,
              size: 28.0,
            ),
          ),
          addHorizontalSpace(3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _readings,
                style: TextStyle(
                  color: COLOR_WHITE,
                  fontFamily: 'Inter',
                  fontSize: 33,
                ),
              ),
              Text(
                _subtitle,
                style: TextStyle(
                  color: COLOR_WHITE,
                  fontFamily: 'Inter',
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
