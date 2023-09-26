import 'package:nuth_buy/exportlinks.dart';
import '../controllers/privacy_policy_controller.dart';
class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicyController controller = Get.put(PrivacyPolicyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTxt("Privacy Policy"),
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
      body: Center(
        child: Obx(
              () => controller.responseData.isEmpty
              ? CircularProgressIndicator() // Show a loading indicator
              : ListView.builder(
            itemCount: controller.responseData.length,
            itemBuilder: (context, index) {
              final item = controller.responseData[index];
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item, style: TextStyle(fontSize:16 ),),
                ),
              );
            },
          ),
        ),
      ),

    );
  }
}

