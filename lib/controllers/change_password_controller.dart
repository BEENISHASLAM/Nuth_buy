import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../common/colors.dart';

class ChangePassController extends GetxController{
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final FocusNode currentPassFocus = FocusNode();
  final FocusNode newPasswordFocus = FocusNode();
  RxBool obscureText = true.obs;
  Rx<IconData> suffixIcon = Icons.remove_red_eye_rounded.obs;
  final GlobalKey<FormState> globalKey = GlobalKey();

  void showPassword() {
    obscureText.value = !obscureText.value;
    suffixIcon.value = obscureText.value ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined;
  }


  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassword,
        );

        await user.reauthenticateWithCredential(credential);

        await user.updatePassword(newPassword);
        Get.snackbar(
          'Password',
          'Change Password Successfully ',
          backgroundColor:CupertinoColors.systemGreen,
          snackPosition: SnackPosition.TOP,
          colorText:white,
        );
       // Get.offAndToNamed('/DashboardScreen');
        print("Password changed successfully!");
      } else {
        Get.snackbar(
          'User',
          'Please make sure the user is authenticated ',
          backgroundColor:Colors.red,
          snackPosition: SnackPosition.TOP,
          colorText:white,
        );
        print("User is null. Please make sure the user is authenticated.");
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'The password is invalid or the user does not have a password',
        backgroundColor:Colors.red,
        snackPosition: SnackPosition.TOP,
        colorText:white,
      );
      print("Error changing password: $error");
      // Handle error, such as displaying an error message to the user
    }
  }


}