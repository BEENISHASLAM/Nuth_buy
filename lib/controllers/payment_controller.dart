import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController{
  final RxString name =''.obs;
   final phoneNumber =''.obs;
   final address = ''.obs;
   final useremail = ''.obs;

  @override
  Future<void> onInit() async  {
    super.onInit();
    loadUserDataFromPreferences();
  }

  Future<void> loadUserDataFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      name.value = prefs.getString('name') ?? '';
      phoneNumber.value = prefs.getString('phoneNumber') ?? '';
      address.value = prefs.getString('address') ?? '';
      useremail.value = prefs.getString('email') ?? '';
    } catch (e) {
      // Handle any errors that may occur during data loading
      print('Error loading user data: $e');
    }
    print(name.value);
  }

}