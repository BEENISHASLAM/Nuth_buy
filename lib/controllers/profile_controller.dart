import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Rx<File?> pickedImage = Rx<File?>(null);
  RxString name = ''.obs;
  RxString email = ''.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImageFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImageFile != null) {
      pickedImage.value = File(pickedImageFile.path);
    } else {
    }
  }
  @override
  Future<void> onInit() async  {
    super.onInit();
    loadUserDataFromPreferences();
  }
  Future<void> loadUserDataFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      name.value = prefs.getString('name') ?? '';
      email.value = prefs.getString('email') ?? '';
    } catch (e) {
      print('Error loading user data: $e');
    }
    print(name.value);
  }

}
