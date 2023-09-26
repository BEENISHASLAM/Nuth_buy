import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuth_buy/components/widgets.dart';
import 'package:nuth_buy/controllers/cart_controller.dart';
import 'package:nuth_buy/controllers/home_controller.dart';

class ProductTile extends StatelessWidget {
  ProductTile({Key? key}) : super(key: key);

  CartController cartController = Get.put(CartController());
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Obx(() {
          if (controller.loading.value) {
            // Show a loader while data is loading
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final products = controller.dataList.value.products;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 8.0, // Spacing between rows
                crossAxisSpacing: 10.0, // Spacing between columns
              ),
              itemBuilder: (BuildContext context, int index) {
                if (products != null && index < products.length) {
                  final data = products[index];
                  // Build and return each grid item
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: productTile(
                      data: data,
                      onPressed: () {
                        cartController.cartadd(data);
                      },
                      onTap: () {
                        Get.toNamed('/productScreen', arguments: data);
                      },
                    ),
                  );
                } else {
                  // Handle the case where the data is null or the index is out of bounds
                  return SizedBox(); // You can replace this with an appropriate widget or leave it empty
                }
              },
              itemCount: products?.length ?? 0, // Number of grid items
            );
          }
        }),
      ),
    );
  }
}
