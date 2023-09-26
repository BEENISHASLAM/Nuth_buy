import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuth_buy/common/colors.dart';
import 'package:nuth_buy/components/widgets.dart';
import '../controllers/login_controller.dart';
import 'button_ui.dart';
class CustomDrawer extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.00,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[DrawerHeader(
          decoration: BoxDecoration(
            color:primaryColorRed,
          ), //BoxDecoration
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(),
            accountName:Obx(() => Text(
              controller.name.value,
              style: TextStyle(fontSize: 18),
            ),),
            accountEmail: Obx(() =>Text(controller.userEmail.value),),
            currentAccountPictureSize: Size.square(50),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: Text(
                "B",
                style: TextStyle(fontSize: 30.0, color: Colors.red),
              ), //Text
            ), //circleAvatar
          ), //UserAccountDrawerHeader
        ),

          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: innerHeading('Cart'),
            onTap: () {
              Get.toNamed('/cartScreen');
            },
          ),
          ListTile(
            leading: Icon(Icons.history, size: 20,),
            title: innerHeading('Order History'),
            onTap: () {
               Get.toNamed('/OrderHistory');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: innerHeading('Settings'),
            onTap: () {
              Get.toNamed('/SettingScreen');
              // Handle Option 3
            },
          ), // Spacer between options and rounded buttons
          SizedBox(height: 250,),
          ListTile(
            title:
            Padding(
              padding: const EdgeInsets.only(left:5, right: 25),
              child:
              Button(label: 'Logout', onTap: (){controller.signOut();},),
            ),
            ),


        ],
      ),
    );
  }
}
