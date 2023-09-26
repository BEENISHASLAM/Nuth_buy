import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
class CategoryController extends GetxController {
  //String data = "";
  //Rx<ProductModel> dataList = ProductModel().obs;
  //
  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  //   fetchData();
  // }
  //
  // Future<void> fetchData() async {
  //   http.Response response;
  //   response = await http.get(Uri.parse('https://dummyjson.com/products'));
  //   if (response.statusCode == 200) {
  //     log(response.body);
  //     var jsonData = json.decode(response.body);
  //     data = jsonData.toString();
  //     dataList.value = ProductModel.fromJson(jsonData);
  //     print('beenihs ${dataList.value.products}');
  //   } else {
  //     data = 'Error: ${response.statusCode}';
  //   }
  // }
}
