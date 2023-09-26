import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nuth_buy/common/colors.dart';
import '../controllers/splash_controller.dart';
class SplashView extends StatelessWidget {
  SplashController controller = Get.put(SplashController());
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primaryColorRed,
      body: Center(
        child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child:Column(children: [
            SizedBox(height:6,),
          AnimatedContainer(
            duration: Duration(seconds: 4), // Animation duration
            curve: Curves.bounceInOut, // Animation curve
            width: 120.0, // Initial width
            height: 120.0, // Initial height
            child: Image.asset('assets/images/logo.png', color: white,), // Your logo asset
          ),
            SizedBox(height: 5,),
            Lottie.asset('assets/HgEh0B23p9.json',),


          ],)
          
            
        )
      ),
    );
  }
}
