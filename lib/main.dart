import 'package:flutter_stripe/flutter_stripe.dart';
import 'exportlinks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationServices().initFirebaseMessaging();
  Stripe.publishableKey =
      'pk_test_51NryD0DpLhmJGXru68a9R2ZwJMHudURgrWeSwPO8pJmBtmnjlTSYipVGLldldiPDPih1tMWoAjSrN9jYBK9YPHcq00s2LGiEPt';
  // await Stripe.instance.applySettings();
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NuthBuy',
      theme: ThemeData(
        // Use Theme.AppCompat or Theme.MaterialComponents here
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: AppRouting.routes,
      initialRoute: '/splashScreen',
    );
  }
}
