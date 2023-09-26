import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class CategoryController extends GetxController {
  // Define an observable RxList to hold the categories.
  RxList<String> categories = <String>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    final apiUrl = Uri.parse('https://dummyjson.com/products/categories'); // Replace with your API endpoint

    try {
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        log(response.body);
        // Parse the JSON and update the RxList
        final List<dynamic> jsonResponse = json.decode(response.body);
        categories.assignAll(jsonResponse.cast<String>());
      } else {
        // If the server did not return a 200 OK response, handle the error
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
