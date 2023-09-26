import 'package:get/get.dart';

class TextInputController extends GetxController {
  final RxBool hasError = false.obs;

  void clearError() {
    hasError.value = false;
  }
}
