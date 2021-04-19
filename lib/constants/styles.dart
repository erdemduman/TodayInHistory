import 'package:flutter/material.dart';

class Styles {
  static Color getSelectedBoxColor() => Colors.white.withOpacity(0.65);
  static TextStyle getDateDialogDayViewTextStyle() =>
      TextStyle(color: Colors.black, fontSize: 20);
  static TextStyle getDateDialogDayViewPickerTextStyle() =>
      TextStyle(color: Colors.black, fontSize: 30);
  static TextStyle getDateDialogDayViewPickerSelectedTextStyle() =>
      TextStyle(color: Colors.cyan, fontSize: 40);
  static TextStyle getDateDialogMonthViewButtonTextStyle() =>
      TextStyle(color: Colors.black, fontSize: 11);
}
