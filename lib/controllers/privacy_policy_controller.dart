import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PrivacyPolicyController extends GetxController {
  RxList<String> responseData = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void>fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("https://loripsum.net/api/plaintext"),
      );

      if (response.statusCode == 200) {
        final List<String> data = response.body.split('\n');
        responseData.assignAll(data);
        log(response.body);
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}

