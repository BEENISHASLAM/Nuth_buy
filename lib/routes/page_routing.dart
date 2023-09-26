
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nuth_buy/views/cart_view.dart';
import 'package:nuth_buy/views/dashboard_view.dart';
import 'package:nuth_buy/views/details_view.dart';
import 'package:nuth_buy/views/forgot_password_view.dart';
import 'package:nuth_buy/views/home_view.dart';
import 'package:nuth_buy/views/login_view.dart';
import 'package:nuth_buy/views/order_history_view.dart';
import 'package:nuth_buy/views/signup_view.dart';
import 'package:nuth_buy/views/splash_view.dart';

import '../views/change_password.dart';
import '../views/check_out.dart';
import '../views/order_view.dart';
import '../views/payment.dart';
import '../views/privacy_policy.dart';
import '../views/setting_view.dart';
import '../views/sucess_screen.dart';
import '../views/terms_conditions_view.dart';

class AppRouting {
  static List<GetPage<dynamic>> routes  =[
    GetPage(name: "/splashScreen", page:()=>SplashView(),),
    GetPage(name: '/loginScreen', page:()=>LoginVIew()),
    GetPage(name: '/signupScreen', page:()=>SignupView()),
    GetPage(name: '/DashboardScreen', page: ()=>DashboardView()),
    GetPage(name: '/homeScreen', page: ()=>HomeView()),
    GetPage(name: '/forgotPasswordScreen', page: ()=>ForgotPassView(),transition: Transition.fade),
    GetPage(name: '/cartScreen', page:()=> CartView()),
    GetPage(name: '/productScreen', page:()=> ProductDetailsView()),
    GetPage(name: '/checkoutScreen', page:()=> CheckOutView(),transition:Transition.fadeIn),
    GetPage(name: '/paymentScreen', page:()=> PaymentScreen(), transition:Transition.rightToLeftWithFade),
    GetPage(name: '/success', page:()=> SucessView(), transition:Transition.fade),
    GetPage(name: '/changePassScreen', page:()=> ChangePasswordView(), transition:Transition.fade),
    GetPage(name: '/DetailScreen', page:()=> ProductDetailsView(), transition:Transition.fade),
    GetPage(name: '/OrderHistory', page:()=> OrderHistoryScreen(), transition:Transition.fade),
    GetPage(name: '/SettingScreen', page:()=> SettingView(), transition:Transition.fade),
    GetPage(name: '/Home', page:()=> HomeScreen(), transition:Transition.fade),
    GetPage(name: '/TermsScreen', page:()=> TermsAndConditions(), transition:Transition.rightToLeft),
    GetPage(name: '/privacyScreen', page:()=> PrivacyPolicy(), transition:Transition.fade),
    //GetPage(name: '/privacy', page:()=> PrivacyPolicyView(pdfUrl: '',), transition:Transition.fade),
  ];
}