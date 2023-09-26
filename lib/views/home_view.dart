import 'package:flutter/cupertino.dart';
import 'package:nuth_buy/exportlinks.dart';
import  'package:badges/badges.dart' as badges;
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeController controller = Get.put(HomeController());
  CartController cartcontroller = Get.put(CartController());
  final CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 1.00,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -1, end: -1),
            showBadge: true,
            ignorePointer: false,
            onTap: () {},
            badgeContent: Obx(() {
              return bagText(
                  '${cartcontroller.cartItemList.value.length}');
            }),
            badgeAnimation: const badges.BadgeAnimation.rotation(
              animationDuration: Duration(seconds: 1),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: const EdgeInsets.all(8),
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1),
              elevation: 0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/bag.svg',
                  color: CupertinoColors.white,
                ),
                tooltip: 'Comment Icon',
                onPressed: () {
                  Get.toNamed('/cartScreen');
                },
              ),
            ),
          ), //IconButton
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.add_alert, color: Colors.white),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ),
          ), //IconButton
        ],
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/hamburger.svg',
            color: Colors.white,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          StackedCardCarousel(),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 25,),
            child: Align(child: Text("Popular Categories 🔥",style: TextStyle(
              fontSize:18,
              fontWeight: FontWeight.w800
            ),),alignment: Alignment.centerLeft,),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height:110,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 80.0, // Set the width of each item as needed
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/card1.png'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                        color: primaryColorRed.withOpacity(1),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Center(
                      child: Text(
                        categoryController.categories[index], // Use the item from the GetX controller
                        style: const TextStyle(fontWeight: FontWeight.w800,
                            color: Colors.white, fontSize:11.0),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 20,),
            child: Align(child: Text("All Products",style: TextStyle(
                fontSize:18,
                fontWeight: FontWeight.w800
            ),),alignment: Alignment.centerLeft,),
          ),
          const SizedBox(
            height:8,
          ),
          Expanded(
            child: Container(
                child: ProductTile()),
          ),
        ],
      ),
    );
  }
}