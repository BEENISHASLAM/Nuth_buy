import 'package:nuth_buy/exportlinks.dart';
import '../controllers/terms_and_coditions_controller.dart';
class TermsAndConditions extends StatelessWidget {
  TermsAndConditionController controller = Get.put(TermsAndConditionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTxt("Terms & Conditions"),
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
      body: Column(
        children: [
          Center(
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
        ],
      ),

    );
  }
}

