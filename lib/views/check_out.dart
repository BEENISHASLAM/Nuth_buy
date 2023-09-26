import 'package:nuth_buy/exportlinks.dart';
import '../controllers/check_out_controller.dart';
class CheckOutView extends StatelessWidget {
  CheckOutController controller = Get.put(CheckOutController());
  CheckOutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: appbarTxt("Checkout"),
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
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 36, right: 36, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: innerHeading('Add Address'),
                ),
                SizedBox(height: 20,),
                _buildForm(),
                SizedBox(height: 33),
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
            onValidate:(str){
              return HelperFunction.checkName(str);
            },
            controller:controller.nameController,
            focus:controller.nameFocus,
            hint:'Name',
          ),
          SizedBox(height: 16),
         TextInput(
           onValidate:(str){
             return HelperFunction.phoneNumber(str);
           },
              controller:controller.phoneNumberController,
              hint: "Mobile number",
              focus: controller.phoneNumberfocus,
          ),
          SizedBox(height: 16),
          TextInput(
            controller:controller.addressController,
            hint: "Address",
            focus: controller.addresFocus,
          ),

          SizedBox(
            height: 24,
          ),
          Button(
            label: 'Payment',
            onTap: () async{
            await  controller.makePayment();
              controller.saveUserDataToPreferences();
            },
          ),
        ],
      ),
    );
  }

}

