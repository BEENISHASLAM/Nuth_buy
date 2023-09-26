import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../services/firebase_api.dart';
class HomeController extends GetxController{
  ScrollController scrollController = ScrollController();
  double scrollPosition = 0.0;
  final TextEditingController searchController = TextEditingController();
  var isButtonPressed = false.obs;
  RxInt currentImageIndex = 0.obs;
  RxBool loading = true.obs;

  String data = "" ;
  final FocusNode searchFocus = FocusNode();
  Rx<ProductModel> dataList = ProductModel().obs;
  NotificationServices notificationServices = NotificationServices();
  @override
  void onInit() {
    fetchData();
    super.onInit();
      notificationServices.requestNotificationPermission();
      notificationServices.firebaseInit();
      notificationServices.getDeviceToken().then((value){
        print("device");
        print(value);
      });
    }

  // var imageUrls = <String>[
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx9UioTWuBxdXYS5VnJ34VU9d3bIZSFk91fWCdB9PDVlIYUlNAB2yQcOHUWSflQTksjfk&usqp=CAU',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw0jxIch85kCnxWATOtNKjKO6OXh7Dzs4NKg&usqp=CAU',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEvF0qLANoGDdTgB5QSuzxLO0xS0IL7gfoPw&usqp=CAU',
  // ].obs;


  fetchData() async {
    try {
      loading.value = true;
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        log(response.body);
        var jsonData = json.decode(response.body);
        data = jsonData.toString();
        dataList.value = ProductModel.fromJson(jsonData);
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${dataList.value.products}>>>>>>>>>>>>>>>>>");
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      loading.value = false;
    }
  }






}



