import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../common/helper_function.dart';
import '../components/button_ui.dart';
import '../components/text_input.dart';
import '../components/widgets.dart';
import '../controllers/login_controller.dart';

class LoginVIew extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  LoginVIew({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 36, right: 36, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 4), // Animation duration
                  curve: Curves.fastEaseInToSlowEaseOut, // Animation curve
                  width: 150.0, // Initial width
                  height: 150.0, // Initial height
                  child: Image.asset('assets/images/logo.png'), // Your logo asset
                ),
                SizedBox(height:35),
                _buildForm(),
                SizedBox(height: 33),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.shade200,
                              Colors.grey.shade400
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(0.5, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.shade400,
                              Colors.grey.shade300,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(0.5, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: ()async{
               final user = await controller.signInWithGoogle();
               if (user != null) {
                 Fluttertoast.showToast(
                   msg: "Sign-In Successful. Welcome, ${user.displayName}!",
                   toastLength: Toast.LENGTH_SHORT,
                   gravity: ToastGravity.BOTTOM,
                   backgroundColor: Colors.green,
                   textColor: Colors.white,
                 );
                 Get.toNamed('/DashboardScreen');
                    } else {
                        }
                    },
                      child:
                      Container(width: 260,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child:
                      _buildSocialBox(FontAwesomeIcons.google ,
                          Colors.red.shade500)),
                    ),
                    // _buildSocialBox(Icons.facebook, Colors.blue),
                  ],
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member? ',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed('/signupScreen');
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue.shade400,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key:controller.globalKey,
      child: Column(
        children: <Widget>[
          TextInput(
            controller:controller.emailController,
            focus:controller.emailFocus,
            onValidate:(str){
              return HelperFunction.checkPassword(str);
            },
            hint:'Email',
          ),
          SizedBox(height: 16),
          Obx(() => TextInput(
              obscure:controller.obscureText.value,
              onValidate:(str){
                return HelperFunction.checkPassword(str);
              },
              controller:controller.passwordController,
              hint: "Password",
              focus: controller.passwordFocus,
              suffixIcon:IconButton(onPressed:(){controller.showPassword();}, icon:Icon(controller.suffixIcon.value))
          ),),
          GestureDetector(
            onTap: () {
              Get.toNamed('forgotPasswordScreen');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.topRight,
              child: headingText1(
                'Forgot password',
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Button(
            label: 'Sign in',
            onTap: () {
              controller.login();
            },
          ),
        ],
      ),
    );
  }
  Container _buildSocialBox(IconData icon, Color color) {
    return Container(
      width:85,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: FaIcon(
          icon,
          size:20,
          color: color,
        ),
      ),
    );
  }
  }

