import 'package:nuth_buy/controllers/payment_controller.dart';
import 'package:nuth_buy/exportlinks.dart';
class PaymentScreen extends StatelessWidget {
  PaymentController controller = Get.put(PaymentController());
   PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTxt("Summary"),
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
            color: white,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body:Column(
        children: [
          SizedBox(
            height:10),
        Container(
          child: Column(children: [
            Center(child: innerHeading('Ship to')),
            SizedBox(height:30,),
          Obx(() =>shipText('Name:${controller.name.value}'),),
            SizedBox(height: 12,),
           Obx(() => shipText('Address:${controller.address.value}')),
            SizedBox(height: 12,),
            Obx(() =>shipText('Contact No:${controller.phoneNumber.value}')),

          ],),
        ),
          SizedBox(height: 200,),
          Container(
            width: 300,
            child: Button(onTap: (){
            Get.toNamed('/success');
            },label: "Place order",),
          )

        ],
      ),
      
    );
  }
}
