import 'package:flutter/cupertino.dart';

class HelperFunction{
  final TextEditingController passwordController = TextEditingController();
  static String? checkName(String? email){
    if(email!.isEmpty){
      return "Name cannot be empty";
    }

    return null;
  }
  static String? checkEmail(String? email){
    if(email!.isEmpty){
      return "Email Address can not be empty";
    }

    return null;
  }
  static String? phoneNumber(String? number){
    if(number!.isEmpty){
      return "number cannot be empty";
    }

    return null;
  }

  static String? checkPassword(String? password) {
    if (password!.isEmpty) {
      return "Password can not be empty";
    }

    if (password.length < 5) {
      return "Password must be of 5 character long";
    }
    return null;
  }
  static String? checkConfPassword(String? confPassword,  String? password){
    if(confPassword!.isEmpty){
      return "Password can not be empty";
    }

    if(confPassword.length <5){
      return "Password must be of 5 character long";
    }
    if(confPassword!=password){
      return 'password match';
    }

    return null;
  }
}