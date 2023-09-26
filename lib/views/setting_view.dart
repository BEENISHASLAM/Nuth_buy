import 'package:nuth_buy/exportlinks.dart';
class SettingView extends StatelessWidget {
  SettingController controller = Get.put(SettingController());
   SettingView({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;
  final screenHeight = mediaQuery.size.height;

  return Scaffold(
    appBar: AppBar(
      title: appbarTxt("Settings"),
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
          color:white
        ),
        tooltip: 'Menu Icon',
        onPressed: () {
          Get.back();
        },
      ),
    ),
    body:
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top:10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed('/changePassScreen');
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,10,25,10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        height: 50,
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30,right: 20),
                              child: Icon(Icons.lock_person_outlined,size:28,),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Chnage Password',style: TextStyle(fontSize:18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500)),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Icon(Icons.keyboard_arrow_right),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed('/privacyScreen');
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,10,25,10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        height: 50,
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30,right: 20),
                              child: Icon(Icons.privacy_tip_outlined,size:28,),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Privacy Policy',style: TextStyle(fontSize:18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500)),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Icon(Icons.keyboard_arrow_right),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed('/TermsScreen');
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,10,25,10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        height: 50,
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30,right: 20),
                              child: Icon(Icons.history_edu_outlined,size: 28,),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Terms & Conditions',style: TextStyle(fontSize:18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500)),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Icon(Icons.keyboard_arrow_right),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
                // Add more settings options as needed
              ],
            ),
          ),
        ),

  );
}
}
