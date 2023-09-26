import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuth_buy/common/colors.dart';
import 'package:nuth_buy/views/cart_view.dart';
import 'package:nuth_buy/views/category_view.dart';
import 'package:nuth_buy/views/details_view.dart';
import 'package:nuth_buy/views/home_view.dart';
import 'package:nuth_buy/views/profile_view.dart';
import 'package:nuth_buy/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';


class DashboardView extends StatelessWidget {
  final DashboardController dashboardController = Get.put(DashboardController());
  final int maxCount = 5;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      PageView(
        controller: dashboardController.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeView(),
          CartView(),
          CategoryView(),
          SettingView(),
          ProfileView(),
        ],
      ),
      // extendBody: true,
      // bottomNavigationBar: Obx(() {
      //   if (dashboardController.selectedIndex.value <= maxCount) {
      //     return AnimatedNotchBottomBar(
      //       notchBottomBarController:dashboardController.Ntchcontroller,
      //       color:primaryColorRed,
      //       showLabel: false,
      //       notchColor: Colors.black87,
      //       // removeMargins: false,
      //       bottomBarWidth: 150,
      //       durationInMilliSeconds: 300,
      //       bottomBarItems: [
      //         BottomBarItem(
      //           inActiveItem: Icon(
      //             Icons.home_filled,
      //             color: Colors.grey.shade100,
      //           ),
      //           activeItem: Icon(
      //             Icons.home_filled,
      //             color:white,
      //           ),
      //           itemLabel: 'Page 1',
      //         ),
      //         BottomBarItem(
      //           inActiveItem: Icon(
      //             Icons.add_shopping_cart_sharp,
      //             color: Colors.grey.shade100,
      //           ),
      //           activeItem: Icon(
      //               Icons.add_shopping_cart_sharp,
      //               color:white
      //           ),
      //           itemLabel: 'Page 2',
      //         ),
      //         BottomBarItem(
      //           inActiveItem: SvgPicture.asset(
      //             'assets/images/categoryIcon.svg',
      //             color:Colors.grey.shade100,
      //           ),
      //           activeItem: SvgPicture.asset(
      //             'assets/images/categoryIcon.svg',
      //             color: Colors.white,
      //           ),
      //           itemLabel: 'Page 3',
      //         ),
      //         BottomBarItem(
      //           inActiveItem: Icon(
      //             Icons.settings,
      //             color:Colors.grey.shade100,
      //           ),
      //           activeItem: Icon(
      //             Icons.settings,
      //             color:white,
      //           ),
      //           itemLabel: 'Page 4',
      //         ),
      //         BottomBarItem(
      //           inActiveItem: Icon(
      //             Icons.person,
      //             color:Colors.grey.shade100,
      //           ),
      //           activeItem: Icon(
      //             Icons.person,
      //             color:white,
      //           ),
      //           itemLabel: 'Page 5',
      //         ),
      //       ],
      //       onTap: (index) {
      //         dashboardController.changePage(index);
      //       },
      //     );
      //   }
      //   return SizedBox.shrink(); // Return an empty widget if the condition is not met.
      // }),
    );
  }
}







