
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/colors.dart';
import '../services/local_db_keys.dart';
import '../views/login_view.dart';
class SignupController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode conPasswordFocus = FocusNode();
  final FocusNode nameFocus = FocusNode();

  RxBool obscureText = true.obs;
  Rx<IconData> suffixIcon = Icons.remove_red_eye_rounded.obs;

  final GlobalKey<FormState> globalKeyForm = GlobalKey();
  RxBool loading = true.obs;

  void showPassword() {
    obscureText.value = !obscureText.value;
    suffixIcon.value = obscureText.value ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined;
  }
  Future<void> signup() async {
    if (globalKeyForm.currentState!.validate()) {
      try {
        loading.value = true;

        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        print(credential.user.toString());

        if (credential != null) {
          //final data = LocaldbKeys.setUserEmail(emailController.text);
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('name', nameController.text);
          prefs.setString('email', emailController.text);

          print(nameController.text);
          print("Account Created Successfully!!!");

          Get.snackbar(
            'Account Created Successfully!',
            '',
            backgroundColor: CupertinoColors.systemGreen,
            snackPosition: SnackPosition.TOP,
            colorText: white,
          );

          Get.offAndToNamed('/loginScreen');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          Get.snackbar(
            'The account already exists for that email',
            '',
            backgroundColor: CupertinoColors.destructiveRed,
            snackPosition: SnackPosition.TOP,
            colorText: white,
          );
        }
      } catch (e) {
        print(e);
      } finally {
        loading.value = false; // Set loading to false after all operations
      }
    }
  }


}
