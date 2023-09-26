
import '../controllers/order_history_controller.dart';
import 'package:nuth_buy/exportlinks.dart';
class OrderHistoryScreen extends StatelessWidget {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTxt("Order history"),
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
      body: Obx(() {
        return ListView.builder(
          itemCount: orderController.orderHistoryList.length,
          itemBuilder: (context, index) {
            final order = orderController.orderHistoryList[index];
             return  OrderTile(text: order.id,orderDate: order.orderDate, imgUrl: order.imageUrl,
                 onPressed:(){
                  orderController.removeOrder(order.id);
                 });
          },
        );
      }),
    );
  }
}
