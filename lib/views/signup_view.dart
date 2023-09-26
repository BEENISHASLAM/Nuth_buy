
import 'package:nuth_buy/exportlinks.dart';

class SignupView extends StatelessWidget {
  SignupController controller = Get.put(SignupController());
  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 0, left: 36, right: 36, bottom:0),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
             // mainAxisAlignment: MainAxisAlignment.start,
             // mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height:0),
                AnimatedContainer(
                  duration: Duration(seconds: 4), // Animation duration
                  curve: Curves.fastEaseInToSlowEaseOut, // Animation curve
                  width: 150.0, // Initial width
                  height: 150.0, // Initial height
                  child: Image.asset('assets/images/logo.png'), // Your logo asset
                ),

                Text(
                  "Create an account to continue!",
                  style: TextStyle(
                    fontSize:18,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(height:20),
                _buildForm(),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.offAndToNamed('/loginScreen');
                      },
                      child: Text(
                        'Sign in',
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
      key:controller.globalKeyForm,
      child: Column(
        children: <Widget>[
          TextInput(
            controller:controller.nameController,
            focus:controller.nameFocus,
            onValidate:(str){
              return HelperFunction.checkEmail(str);
            },
            hint:'Name',
          ),
          SizedBox(height: 16,),
          TextInput(
            controller:controller.emailController,
            focus:controller.emailFocus,
            onValidate:(str){
              return HelperFunction.checkEmail(str);
            },
            hint:'Email',
          ),
          SizedBox(height: 16,),
          TextInput(
            controller:controller.passwordController,
            focus:controller.passwordFocus,
            onValidate:(str){
              return HelperFunction.checkEmail(str);
            },
            hint:'Password',
          ),
          SizedBox(height: 16),
          Obx(() => TextInput(
              obscure:controller.obscureText.value,
              onValidate:(str){
                return HelperFunction.checkConfPassword(str, controller.passwordController.text);
              },
              controller:controller.confPasswordController,
              hint: "Confrim Password",
              focus: controller.conPasswordFocus,
              suffixIcon:IconButton(onPressed:(){controller.showPassword();}, icon:Icon(controller.suffixIcon.value))
          ),),
          SizedBox(height: 16,),

          SizedBox(
            height: 24,
          ),
          LoadingButton(
            label: 'Register',
            onTap: () {
             controller.loading.value;
              controller.signup();

            },
            isLoading: controller.loading.isFalse
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
          size:30,
          color: color,
        ),
      ),
    );
  }
}

