import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ToastMessage {
  static void showToast(
      String message, {
        Toast length = Toast.LENGTH_SHORT,
        ToastGravity gravity = ToastGravity.BOTTOM,
        int timeInSecForIosWeb = 1,
        Color? backgroundColor,
        Color? textColor,
        double fontSize = 16.0,
      }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
