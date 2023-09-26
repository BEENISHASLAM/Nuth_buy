import 'dart:convert';
import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../services/local_db_keys.dart';
class DashboardController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final RxInt selectedIndex = 0.obs;
  final NotchBottomBarController Ntchcontroller = NotchBottomBarController(index: 0);
  void changePage(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}


// class DashboardController extends GetxController{
//   final RxString userEmail = ''.obs;
//   String data = "";
//   Rx<ProductModel> dataList = ProductModel().obs;
// late PageController  pageController;
// GlobalKey bottomNavigationKey = GlobalKey();
// var page = RxInt(0);
// @override
//   void onInit() {
//     super.onInit();
//     pageController=PageController();
//     getUserData();
//   }
//   void checkItem(int index){
//   if(index!=page.value) page(index);
//   }
//
//   Future<void> getUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     userEmail.value = prefs.getString(LocaldbKeys.userEmailKey) ?? '';
//     print('beenish ${userEmail.value}');
//   }
//
//
// }