import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:nuth_buy/common/colors.dart';
import 'package:nuth_buy/components/button_ui.dart';
import 'package:nuth_buy/components/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuth_buy/controllers/cart_controller.dart';
import 'package:nuth_buy/model/model.dart';
class CartView extends StatelessWidget {
   CartView({Key? key}) : super(key: key);
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTxt("My Cart"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation:1.00,
        backgroundColor:Colors.black87,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/arrowback.svg',
            height: 30,
            width: 30,
            color:white,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            Get.back();
          },
        ),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Obx(() {
              if (controller.cartItemList.isEmpty) {
                // Show a message when the cart is empty
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,

                  ),
                );
              } else {
                // Show the list of cart items
                return Container(
                  height: 270,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartItemList.length,
                      itemBuilder: (context, index) {
                        final cartItem = controller.cartItemList[index];
                        return CartTile(
                          item: cartItem,
                          onPressed: () {
                            controller.removeItem(cartItem);
                            print("fee");
                          },
                          increment: () {
                            controller.increasQty(cartItem);
                          },
                          decrement: () {
                            controller.decQty(cartItem);
                          },
                        );
                      },
                    ),
                  ),

                );
              }
            }),
            SizedBox(height:40,),
            Obx(() {
              if (controller.cartItemList.isNotEmpty) {
                // Show the total price and checkout button when there are items in the cart
                return
                 Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child:Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment:MainAxisAlignment.start,
                     children: [
                       Container(
                         decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                         ),
                       child: Column(children: [
                         Row(
                           mainAxisAlignment:MainAxisAlignment.spaceAround,
                           children: [
                            Obx(() => innertext('Items: ${controller.cartItemList.length}'),),
                             Obx(() =>normalText('Rs:${controller.getTotal()}'),)
                         ],),
                         SizedBox(height: 10,),
                         Row(
                           mainAxisAlignment:MainAxisAlignment.spaceAround,
                           children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: innertext('Shipping'),
                            ),
                         Obx(() =>  normalText(controller.shipping.value.toString()!)),
                         ],),
                         SizedBox(height: 30,),
                         Row(
                           mainAxisAlignment:MainAxisAlignment.spaceAround,
                           children: [
                             innerHeading('Total price'),
                            Obx(() => innerHeading('Rs:${controller.getSubTotal()}'),),
                           ],),

                       ],),),
                       SizedBox(height:30,),
                       Padding(
                         padding: const EdgeInsets.only(left:30, right: 30),
                         child: Container(
                           child:
                         Button( onTap: (){
                           Get.toNamed('/checkoutScreen');
                         }, label: 'Checkout',),),
                       ),
                   ],),
                 );
              } else {
                // Return an empty container when the cart is empty
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                          child: Lottie.asset(
                            'assets/W8KT7gdvuG.json', // Replace with the path to your Lottie animation file
                            width: 250, // Optional width
                            height: 250, // Optional height
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                      ),
                    ),
                    innertext("Your cart is empty"),
                  ],
                );
              }
            }),
          ],
        )

    );
  }
}
