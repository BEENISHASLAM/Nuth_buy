import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nuth_buy/components/button_ui.dart';
import 'package:nuth_buy/components/widgets.dart';
class SucessView extends StatelessWidget {
  const SucessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 60,),
      Center(
        child: Lottie.asset(
          'assets/k7HJP1CzXT.json', // Replace with the path to your Lottie animation file
          width: 200, // Optional width
          height: 200, // Optional height
          fit: BoxFit.cover, // Adjust the fit as needed
        ),
      ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            appbarTxt("Payment Successful!"),
            SizedBox(height:4,),
            innertext('Orders will arrive in 3 days!')
              
          ],
        ),
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Button(label: 'Go to Home', onTap: (){
          Get.toNamed('/DashboardScreen');}
          ,),
        )
      ])
    );
  }
}
