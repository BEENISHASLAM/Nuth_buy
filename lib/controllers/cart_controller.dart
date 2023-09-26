import 'package:flutter/cupertino.dart';
import 'package:nuth_buy/exportlinks.dart';
class CartController extends GetxController {
  RxList<CartModel> cartItemList = List<CartModel>.empty().obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt quantity = 0.obs;
  RxInt shipping = 100.obs;

  cartadd(Products item) {
    if (cartItemList.isEmpty) {
      print("add to cart");
      cartItemList.add(
        CartModel(
          name: item.title,
          id: item.id,
          price: double.parse(item.price.toString()),
          quantity: 1,
          imgUrl: item.thumbnail,
        ),
      );

      Get.snackbar(
        'cart Added succefully ',
        'View your cart',
        backgroundColor:CupertinoColors.systemGreen,
        snackPosition: SnackPosition.TOP,
        colorText:white,
      );
    } else {
      // Find the index of the item in the cart list
      int existingItemIndex = cartItemList.indexWhere(
            (element) => element.id == item.id,
      );

      if (existingItemIndex != -1) {
        print('Item already in the cart');
        cartItemList[existingItemIndex].quantity =  cartItemList[existingItemIndex].quantity! + 1;
        // cartItemList.forEach((element) {
        //    totalPrice.value = element.price! * element.quantity!;
        //    print(element.quantity);
        //    print(totalPrice);
        // });

      } else {
        print('Item not in the cart');
        // Item does not exist in the cart, so add it
        cartItemList.add(
          CartModel(
            name: item.title,
            id: item.id,
            price: double.parse(item.price.toString()),
            quantity: 1,
            imgUrl: item.thumbnail,
          ),
        );
        Get.snackbar(
          'cart Added succefully ',
          'View your cart',
          backgroundColor:CupertinoColors.systemGreen,
          snackPosition: SnackPosition.TOP,
          colorText:white,
        );
      }
    }
    for (var item in cartItemList) {
      double itemTotal = item.price! * item.quantity!;
      print('${item.name} - Quantity: ${item.quantity}, Price: \$${itemTotal.toStringAsFixed(2)}');
       totalPrice.value += itemTotal;
       print(totalPrice);
      quantity.value= item.quantity!;
    }
    //price();
    //price();
    forTesting();
    // calculateTotalPrice(item);
  }

  forTesting() {
    cartItemList.forEach((element) {
      print('id ${element.id}');
      print('name ${element.name}');
      print('price ${element.price}');
      print('quantity ${element.quantity}');
      print('imgUrl ${element.imgUrl}');
      print('price ${element.price}');
      totalPrice.value = element.price! * element.quantity!;
      print('After assignment: ${totalPrice.value}');
      //totalPrice.value =element.price!;
    });
    // Update the globalPrice using .value
  }

  void removeItem(CartModel item) {
    cartItemList.removeWhere((element) => element.id == item.id);
    cartItemList.refresh();
    print(item.id);
  }



  void increasQty(CartModel item) {
    if (item.quantity != null && item.quantity! >= 1) {
      print('Before increment: ${item.quantity}');
      item.quantity = item.quantity! + 1;
      double itemTotal = item.price! * item.quantity!;
      totalPrice.value=itemTotal;
      print("after :${totalPrice}");
      print('After increment: ${item.quantity}');
      print(item.quantity!);
      cartItemList.refresh();
      update();
      cartItemList.refresh();
    }
  }

  void decQty(CartModel item) {
    if (item.quantity != null && item.quantity! >= 1) {
      print('Before increment: ${item.quantity}');
      item.quantity = item.quantity! - 1;
      print('After increment: ${item.quantity}');
      double itemTotal = item.price! - item.quantity!;
      totalPrice.value=itemTotal;
      print(item.quantity!);
      cartItemList.refresh();
      update();
    }
  }

  double getTotal() {
    double total = 0;
    for (var item in cartItemList) {
      total += item.price! * item.quantity!;
    }
    return total;
  }
  double getSubTotal (){
    double total = getTotal();
    return total + shipping.value;
  }
}











