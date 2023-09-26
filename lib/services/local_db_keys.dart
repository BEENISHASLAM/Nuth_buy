import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LocaldbKeys  {
  static final String userEmailKey = 'userEmail';

  static Future<void>setUserEmail (email)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userEmailKey, email);
  }

  static Future<void> getUserEmail()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString(userEmailKey) ?? '';
  }
  static final String loggedInKey = 'loggedIn';

  static final String userImgKey = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-4ad_Qmbv1Q2JZwvVEI22wFtIj4Qb4ZzcgA&usqp=CAU';

  static Future<void> setUserLoggedIn(bool loggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(loggedInKey, loggedIn);
  }


  static Future<bool> getUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false;
  }


  static Future<void> SetuserImage(String userImgKey) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(userImgKey, userImgKey);
  }


  static Future<void>getUserImage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString(userImgKey);
  }

}