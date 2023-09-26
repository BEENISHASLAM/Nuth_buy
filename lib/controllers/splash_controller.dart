import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/local_db_keys.dart';
class SplashController extends GetxController{
  final RxString userEmail = ''.obs;
  final user =''.obs;
  @override
  Future<void> onInit() async  {
    super.onInit();
    Timer(Duration(seconds:5), checkAuthentication);
  }
  void checkAuthentication()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail.value = prefs.getString('email') ?? '';
    if (userEmail.value.isNotEmpty){
     Get.offAndToNamed('/DashboardScreen');
      print(userEmail.value);
    }
    else{
      Get.toNamed('/loginScreen');
    }
  }

}