export  'package:flutter_stripe/flutter_stripe.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:nuth_buy/exportlinks.dart';
import 'check_out_controller.dart';
class CheckOutController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode phoneNumberfocus = FocusNode();
  final FocusNode addresFocus = FocusNode();
  RxString userEmail = ''.obs;
  Map<String, dynamic>? paymentIntentData;
  final GlobalKey<FormState> globalKey = GlobalKey();

  Future<void> saveUserDataToPreferences() async {
    if(globalKey.currentState!.validate()){
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('name', nameController.text);
        prefs.setString('phoneNumber',phoneNumberController.text);
        prefs.setString('address', addressController.text);
        prefs.setString('email', emailController.text);
       print(nameController.text);
    }

    }
  Future<void> makePayment() async {
    try {
      paymentIntentData =
      await createPaymentIntent('20', 'USD');
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              setupIntentClientSecret: 'sk_test_51NryD0DpLhmJGXru3V8Kq1Cq7rdQZXzg3Utx7bqJJ8JC3escO5MMNZ2X5PYNWWzITwNV6QLj0A2tCb8ECt4kVeoW00PrECe1T8',
              paymentIntentClientSecret:
              paymentIntentData!['client_secret'],
              customFlow: true,
              //style: ThemeMode.system,
              merchantDisplayName: 'Beenish'))
          .then((value) {});
      displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
        //       parameters: PresentPaymentSheetParameters(
        // clientSecret: paymentIntentData!['client_secret'],
        // confirmPayment: true,
        // )
      )
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        Fluttertoast.showToast(
          msg: "paid successfully.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        // ScaffoldMessenger.of(context as BuildContext)
        //     .showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
        Get.toNamed('/paymentScreen');
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      Fluttertoast.showToast(
        msg: "Cancelled.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ' + 'sk_test_51NryD0DpLhmJGXru3V8Kq1Cq7rdQZXzg3Utx7bqJJ8JC3escO5MMNZ2X5PYNWWzITwNV6QLj0A2tCb8ECt4kVeoW00PrECe1T8',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      print('payemnt api hit beenish nnnnnnnnnnnnnnnnnn');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

}

