import 'package:get/get.dart';
import 'package:nuth_buy/model/product_model.dart';

class OrderController extends GetxController {
  RxList<OrderHistory> orderHistoryList = <OrderHistory>[].obs;

  @override
  void onInit() {
    super.onInit();
    addDummyOrderHistoryData();
  }

  void addDummyOrderHistoryData() {
    // Add dummy data to the order history list
    orderHistoryList.add(
      OrderHistory(
        id: 1,
        orderDate: DateTime.now().subtract(Duration(days: 2)),
        imageUrl:
        'https://www.pngmart.com/files/22/Mi-PNG-Isolated-Photo.png'
      ),
    );

    orderHistoryList.add(
      OrderHistory(
        id: 2,
        orderDate: DateTime.now().subtract(Duration(days: 5)),
        imageUrl:
        'https://www.pngmart.com/files/15/Apple-iPhone-12-Transparent-Images-PNG.png', // Replace with your image URL
      ),
    );

    orderHistoryList.add(
      OrderHistory(
        id: 3,
        orderDate: DateTime.now().subtract(Duration(days: 10)),
        imageUrl:
        'https://www.pngmart.com/files/15/Apple-iPhone-11-PNG-Image.png', // Replace with your image URL
      ),
    );
  }
  void removeOrder(int orderId) {
    orderHistoryList.removeWhere((order) => order.id == orderId);
  }
}
