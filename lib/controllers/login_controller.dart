import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/colors.dart';
import '../services/local_db_keys.dart';
class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  RxBool obscureText = true.obs;
  Rx<IconData> suffixIcon = Icons.remove_red_eye_rounded.obs;
  RxString userEmail = ''.obs;
  RxString name = ''.obs;
  var isLoading = true.obs;
  final GlobalKey<FormState> globalKey = GlobalKey();
  void showPassword() {
    obscureText.value = !obscureText.value;
    suffixIcon.value = obscureText.value ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined;
  }

  Future<void> login() async {
    if(globalKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        if (credential != null) {
          // final userEmail= LocaldbKeys.getUserEmail();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userEmail.value = prefs.getString(LocaldbKeys.userEmailKey) ?? '';
          name.value = prefs.getString('name') ?? '';
          print(name);
          if (userEmail != null) {
            print("user login Successfully!!!");
            Get.snackbar(
              'Welcome',
              'you are  loginSuccessfully ',
              backgroundColor: CupertinoColors.systemGreen,
              snackPosition: SnackPosition.TOP,
              colorText: white,
            );
            userEmail.value = prefs.getString('userEmail') ?? '';
            print(userEmail.value);
            Get.toNamed('/DashboardScreen');
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            'User',
            'Wrong password ',
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP,
            colorText: white,
          );
          print('Wrong password provided for that user.');
        }
      }
      isLoading.value = false;
    }
  }





//  signout

  Future<void> signOut() async {
    emailSignOut();
    await GoogleSignIn().signOut();
  }


  Future<void> emailSignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("userSignut");
      Get.toNamed('/loginScreen');
    } catch (e) {
      print("Error signing out: $e");
    }
  }


    Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      return user;
    } catch (e) {
      print("Error during sign-in: $e");
      Fluttertoast.showToast(
        msg: "Sign-In Failed. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return null;
    }
  }

}



