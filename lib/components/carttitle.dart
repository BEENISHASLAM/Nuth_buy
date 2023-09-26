// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../controllers/cart_controller.dart';
// class CartTile extends StatelessWidget {
//   CartController controller = Get.find();
//    CartTile({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 140,
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color:white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey,
//             blurRadius: 5,
//             spreadRadius: 1
//           )
//         ]
//       ),
//       child:Row(children: [
//        InkWell(
//          onTap: (){},
//          child: Stack(
//            alignment: Alignment.centerLeft,
//            children: [
//              Container(
//                margin: EdgeInsets.only(top: 10, right: 60),
//                height:90 ,
//                width:100 ,
//                decoration: BoxDecoration(
//                  color: Colors.black26,
//                  borderRadius: BorderRadius.circular(10)
//
//                ),
//              ),
//              Image.asset('assets/images/Laptop.png',
//              width: 120,
//                height: 120,
//                fit: BoxFit.contain,
//              )
//            ],
//          ),
//        ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical:30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//                normalText('Laptop'),
//               Row(children: [
//                 Container(
//                   padding: const EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                       color:white.withOpacity(1.0),
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                             color:fontGrey,
//                             blurRadius: 5,
//                             spreadRadius: 1
//                         )
//                       ]
//                   ),
//                   child:SvgPicture.asset(
//                     'assets/images/minus.svg',
//                     width: 15.0, // Set the width of the SVG
//                     height: 15.0,
//                     color:black,// Set the height of the SVG
//                     // Set the color of the SVG (optional)
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   child: normalText("02"),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     color:white.withOpacity(1.0),
//                     borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                             color:fontGrey,
//                             blurRadius: 5,
//                             spreadRadius: 1
//                         )
//                       ]
//                   ),
//                   child:SvgPicture.asset(
//                     'assets/images/plus1.svg',
//                     width: 15.0, // Set the width of the SVG
//                     height: 15.0,
//                     color:black,// Set the height of the SVG
//                      // Set the color of the SVG (optional)
//                   ),
//                 ),
//               ],
//               ),
//             ],
//           ),
//         ),
//         Spacer(),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 25),
//           child: Column(children: [
//             Container(
//             padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color:white.withOpacity(1.0),
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                         color:fontGrey,
//                         blurRadius: 5,
//                         spreadRadius: 1
//                     )
//                   ]
//               ),
//               child:Center(
//                 child: SvgPicture.asset(
//                   'assets/images/deletesvg.svg',
//                   width: 15.0, // Set the width of the SVG
//                   height: 15.0,
//                   // Set the height of the SVG
//                   // Set the color of the SVG (optional)
//                 ),
//               ),
//             ),
//             Spacer(),
//             priceText1("9000",Colors.red),
//           ],),
//         )
//       ],
//       ),
//     );
//   }
// }
