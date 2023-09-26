import 'package:nuth_buy/exportlinks.dart';
class ForgotPassView extends StatelessWidget {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());
  ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: appbarTxt("Forgot Password"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation:1.00,
        backgroundColor:Colors.black87,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/arrowback.svg',
            height: 30,
            width: 30,
            color: white,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(children: [
        SizedBox(height: 25,),
        Center(
          child: Container(
            child:SvgPicture.asset(
              'assets/images/login-lock.svg',
              height: 100,
              width: 100,
            ),
          ),
        ),
        SizedBox(height:20,),
        headingText('Forgot Password'),
        Padding(
          padding: const EdgeInsets.only(left:20, right: 20, top:4,bottom: 20),
          child: normalText("Provide your account's email for which you want to rest your password "),
        ),
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius:BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: TextInput(
              controller:controller.emailController,
              focus:controller.emailFocus,
              hint:'Email',
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 300,
          child:Button(
            label: 'Forgot password',
            onTap: () {
            controller.resetPassword();
            },
          ),
        ),

      ],
      ),
    );

  }
}
