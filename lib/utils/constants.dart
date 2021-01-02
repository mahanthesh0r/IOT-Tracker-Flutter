import 'package:flutter/material.dart';
import 'package:tracker/model/ListViewModel.dart';

const COLOR_RED = Color.fromRGBO(253, 114, 114, 1.0);
const COLOR_GREY = Color.fromRGBO(240, 245, 247, 1.0);

const COLOR_WHITE = Color.fromRGBO(255, 255, 255, 1.0);
const COLOR_LIGHT_WHITE = Color.fromRGBO(255, 255, 255, 0.3);
const COLOR_SCREEN_BG = Color.fromRGBO(240, 245, 247, 1.0);
const COLOR_BLACK = Color.fromRGBO(12, 7, 56, 1.0);
const COLOR_SHADOW = Color.fromRGBO(0, 0, 0, 0.09);

const TextTheme TEXT_THEME_DEFAULT = TextTheme(
    headline1: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 26),
    headline2: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 22),
    headline3: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 20),
    headline4: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 16),
    headline5: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 14),
    headline6: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 12),
    bodyText1: TextStyle(
        color: COLOR_BLACK,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: COLOR_GREY,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: COLOR_BLACK, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY, fontSize: 12, fontWeight: FontWeight.w400));

const TextTheme TEXT_THEME_SMALL = TextTheme(
    headline1: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 22),
    headline2: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 20),
    headline3: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 18),
    headline4: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 14),
    headline5: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 12),
    headline6: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 10),
    bodyText1: TextStyle(
        color: COLOR_BLACK,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: COLOR_GREY,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: COLOR_BLACK, fontSize: 10, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY, fontSize: 10, fontWeight: FontWeight.w400));

List<ListViewModel> listData = [
  ListViewModel(Icons.map, "Live-Tracking", "Real-Time Location"),
  ListViewModel(Icons.ac_unit, "Heater", "Jacket Heater", toggle: true),
  ListViewModel(Icons.ac_unit, "Heater", "Ambient Heater", toggle: false),
  ListViewModel(Icons.lock, "Lock", "Lock 1", toggle: false),
  ListViewModel(Icons.lock, "Lock", "Lock 2", toggle: true),
  ListViewModel(Icons.lock, "Lock", "Lock 3", toggle: true),
];
