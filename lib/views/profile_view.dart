import 'package:nuth_buy/exportlinks.dart';
class ProfileView extends StatelessWidget {
   ProfileController controller = Get.put(ProfileController());
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTxt("Profile"),
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
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/arrowback.svg',
            height: 30,
            width: 30,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80,),
            Column(
              children: <Widget>[
                Obx(() {
                  final pickedImage = controller.pickedImage.value;
                  if (pickedImage != null) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: CircleAvatar(
                        backgroundImage: FileImage(pickedImage),
                        radius: 50,
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        width: 300,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor:Colors.white,
                              radius: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/edit-profile-svgrepo-com.svg',
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }),
               Obx(() => Text(controller.name.value,
                 style: TextStyle(
                  fontWeight: FontWeight.w800,fontSize: 25
                ),),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Obx(() =>Text("[ ${controller.email.value} ]",style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),),),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}