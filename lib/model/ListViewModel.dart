import 'package:flutter/material.dart';

class ListViewModel {
  IconData iconData;
  String title, subtitle;
  IconButton iconButton;
  bool toggle;

  ListViewModel(this.iconData, this.title, this.subtitle,
      {this.iconButton, this.toggle});
}
