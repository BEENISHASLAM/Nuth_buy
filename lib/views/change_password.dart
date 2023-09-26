import 'package:nuth_buy/exportlinks.dart';
class ChangePasswordView extends StatelessWidget {
  ChangePassController controller = Get.put(ChangePassController());
  ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: appbarTxt("Change Password"),
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
            color:white,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left:0, right:0, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left:26, right:26, bottom: 56),
                      child: _buildForm(),
                    )),
                SizedBox(height: 33),
              ],
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
            onValidate:(str){
              return HelperFunction.checkPassword(str);
            },
            controller:controller.currentPassController,
            focus:controller.currentPassFocus,
            hint:'Current Password',

          ),
          SizedBox(height: 16),
    Obx(() =>TextInput(
            obscure:controller.obscureText.value,
            onValidate:(str){
              return HelperFunction.checkPassword(str);
            },
            controller:controller.newPassController,
            hint: "New Password",
            focus: controller.newPasswordFocus,
        suffixIcon:IconButton(onPressed:(){controller.showPassword();}, icon:Icon(controller.suffixIcon.value)),
          )),
          SizedBox(height:20),

          Button(
            label: 'Save',
            onTap: () {
             String oldPassword =controller.currentPassController.text;
             String newPassword = controller.newPassController.text;
              controller.changePassword(oldPassword, newPassword);
            },
          ),
        ],
      ),
    );
  }

}
