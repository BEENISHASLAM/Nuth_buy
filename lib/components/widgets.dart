import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:nuth_buy/common/colors.dart';
import '../exportlinks.dart';
import '../model/model.dart';
import 'package:flutter_svg/flutter_svg.dart';
Widget headingText1(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey.shade600,),);
}
Widget bagText(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w600,color:white,fontSize:10),);
}
Widget headingText(String? title,){
  return Text(title!, style: TextStyle(fontWeight:FontWeight.bold,fontSize:25),);
}
Widget shipText(String? title,){
  return Text(title!, style: TextStyle(fontWeight:FontWeight.bold,fontSize:14, color: Colors.black54),);
}
Widget appbarTxt(String? title){
  return Text(title!, style: TextStyle(fontWeight:FontWeight.bold,fontSize:22),);
}
Widget innerHeading(String? title){
  return Text(title!, style: TextStyle(fontWeight:FontWeight.bold,fontSize:16),);
}
Widget innertext(String? title){
  return Text(title!, style: TextStyle(fontWeight:FontWeight.bold,fontSize:12, color:Colors.grey),);
}
Widget normalText(String? title){
  return Text(title!, style: TextStyle(fontSize:12,color: Colors.black87,fontWeight: FontWeight.bold),maxLines: 1,);
}
Widget priceText(String? title){
  return Text(title!, style: TextStyle(color:Colors.black87, fontSize:12, fontWeight: FontWeight.bold),);
}
Widget listText(String? title){
  return Text(title!, style: TextStyle(color:Colors.black, fontSize:14, fontWeight: FontWeight.bold),);
}
Widget priceText1(String? title, Color? color ){
  return Text(title!, style: TextStyle(color:color, fontSize:18, fontWeight: FontWeight.bold),);
}
Widget myCustomTextField(
    {required TextEditingController controller,
  required FocusNode focus,
  required TextInputAction inputAction,
  required TextInputType textInputType,
  bool obsecureText = false,
  String? Function(String? val)? onValidate,
  Widget? suffixIcon, required String hintText,
  Widget?prefixIcon
}) {
  return TextFormField(
    controller: controller,
    focusNode: focus,
    validator: onValidate,
    textInputAction: inputAction,
    keyboardType: textInputType,
    obscureText: obsecureText,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: InputBorder.none,
    ),
  );
}

Widget tile ({required Products? data , required onPressed}){
  return  Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      Container(
        margin:
        const EdgeInsets.only(left: 20, right: 20),
        padding: const EdgeInsets.only(left: 20),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(data!.thumbnail!),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.title?.toUpperCase() ?? '',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                 ),
                // Text(
                //   data.description ?? '',
                //   style: const TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //   ),
                // ),
                Text(
                  data.brand ?? '',
                  style: const TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 15,
                  ),
                ),
                ElevatedButton(onPressed:onPressed, child: Text("Add to Cart"))
              ],
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}

Widget customTextFiled({
  required TextEditingController controller,
  String? Function(String? val)? onValidate,
  Widget? suffixIcon,
  required String hintText,
}) {
  return TextFormField(
    controller: controller,
    validator: onValidate,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[400]),
      suffixIcon: suffixIcon,
      border: GradientOutlineInputBorder(
  gradient: LinearGradient(colors: [
    Color.fromRGBO(253, 136, 136, 0.7019607843137254),
    Color.fromRGBO(151, 204, 248, 1.0),
  ]
  ),
  width: 2,
        borderRadius: BorderRadius.circular(25)
  ),

    ),
  );
}

Widget productTile ({required Products? data , required onPressed, required onTap}) {
   return GestureDetector(
     onTap:onTap ,
     child:Container(
       width: 380,height:380,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12.0),
           color: Colors.grey.shade200,
       ),
       child: Column(
         children: [
           Container(
             height: 90,
           width: 90,
           decoration: BoxDecoration(
               borderRadius:BorderRadius.circular(8),
               image: DecorationImage(image:
                 NetworkImage(data!.thumbnail!,),
                 fit: BoxFit.fitHeight,)
            ),
           ),
               normalText(data?.title),
               priceText("Rs ${data?.price}"),
       Padding(
         padding: const EdgeInsets.only(left: 70),
         child: Container(
           height:40,
           child: CircleAvatar(
             backgroundColor: Colors.white,
             child: Center(
               child: IconButton(
                   onPressed:onPressed,
                   icon: Icon(Icons.add_shopping_cart_sharp,color: primaryColorRed,)),
             ),
           ),
         ),
       ),

         ],
       ),
     ),
   );

}
Widget OrderTile({required text ,required orderDate, required imgUrl, required onPressed }){
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      Container(
        margin:
        const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.only(left: 20),
        height: 120,
        decoration: BoxDecoration(
          color:Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width:100,
              height: 100,
              child: Image.network(imgUrl),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 text.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize:13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  orderDate.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize:10,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.delete,color:primaryColorRed,),
                  onPressed: onPressed
                    // orderController.removeOrder(order.id);
                  ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
Widget CartTile ({required CartModel? item , required onPressed, required increment, required decrement}) {
   return Column(children: [
     const SizedBox(
       height:12,
     ),
       Container(
         margin:
         const EdgeInsets.only(left:20, right: 20),
         padding: const EdgeInsets.only(left: 20),
         height: 120,
         decoration: BoxDecoration(
           color:Colors.grey.shade200,
           borderRadius: BorderRadius.circular(15),
         ),
         child: Row(
           children: [
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
               ),
               width:100,
               height:200,
               child: Image.network(item!.imgUrl!, height:200,),
             ),
             // CircleAvatar(
             //   radius: 35,
             //   backgroundImage: NetworkImage(order.imageUrl,),
             // ),
             const SizedBox(
               width:23,
             ),
             Column(
               crossAxisAlignment:
               CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   width: 80,
                   child: Text(
                     item.name.toString(),
                     style: const TextStyle(
                       color: Colors.black,
                       fontSize:12,
                       fontWeight: FontWeight.w700,
                     ),
                   ),
                 ),
                 SizedBox(height: 10,),
                 Container(
                   width:65,
                   height:25,
                   decoration: BoxDecoration(
                     color:Colors.white54,
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                     Container(
                       padding: const EdgeInsets.all(5),
                       decoration: BoxDecoration(
                           color:primaryColorRed,
                           borderRadius: BorderRadius.circular(20),
                           boxShadow: [
                             BoxShadow(
                                             color:primaryColorGray,
                                             blurRadius:2,
                                             spreadRadius: 1
                                         )
                                       ]
                                   ),
                                   child:InkWell(
                                     onTap: decrement,
                                     child: SvgPicture.asset(
                                       'assets/images/minus.svg',
                                       width:10.0, // Set the width of the SVG
                                       height:10.0,
                                       color:white,// Set the height of the SVG
                                       // Set the color of the SVG (optional)
                                     ),
                                   ),
                                 ),
              Container(
                margin: EdgeInsets.symmetric(horizontal:5),
                child: priceText(item.quantity.toString(),),
              ),
                     Container(
                       padding: const EdgeInsets.all(5),
                                     decoration: BoxDecoration(
                                         color:primaryColorRed,
                                         borderRadius: BorderRadius.circular(20),
                                         boxShadow: [
                                           BoxShadow(
                                               color:primaryColorGray,
                                               blurRadius:2,
                                               spreadRadius: 1
                                           )
                                         ]
                                     ),
                                     child:InkWell(
                                       onTap: increment,
                                       child: SvgPicture.asset(
                                         'assets/images/plus1.svg',
                                         width:10.0, // Set the width of the SVG
                                         height:10.0,
                                         color:white,// Set the height of the SVG
                                         // Set the color of the SVG (optional)
                                       ),
                                     ),
                                   ),

                   ],),
                 ),
               ],
             ),
             Spacer(),
             Padding(
               padding: const EdgeInsets.only(right:0),
               child: Container(
                 child: priceText(item.price.toString()),
               ),
             ),
           Align(
             alignment: Alignment.topRight,
               child: Container(
                 decoration: BoxDecoration(
                color:primaryColorRed,
                 borderRadius: BorderRadius.only(
  bottomLeft: Radius.circular(30.0),
  topLeft: Radius.circular(5.0),
                   bottomRight: Radius.circular(5.0),
                   topRight: Radius.circular(15.0),


                 ),

                 ),
                 child:IconButton(
                     icon: Icon(Icons.delete,color:white,size: 20,),
                     onPressed: onPressed
                   // orderController.removeOrder(order.id);
                 ),
               )),
           ],
         ),
       )]);

}


Widget SettingsTile ({required text, required icon }){
  return  GestureDetector(
    onTap: (){
      Get.toNamed('');
    },
    child: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25,10,25,10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200,
          ),
          height: 50,
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30,right: 20),
                child: Icon(Icons.history,size: 30,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('text',style: TextStyle(fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500)),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),

      ),
    ),
  );
}