import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class SettingController extends GetxController{

  void openPDFFromGoogleDrive(String pdfUrl) async {
    if (await canLaunch(pdfUrl)) {
      await launch(pdfUrl);
    } else {
      throw 'Could not launch $pdfUrl';
    }
  }



}