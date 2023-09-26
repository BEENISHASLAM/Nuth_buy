import 'package:nuth_buy/exportlinks.dart';
import '../controllers/categor_controllert.dart';
class CategoryView extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTxt("Category"),
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
            color:Colors.white,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Obx(
                () {
              if (categoryController.categories.isEmpty) {
                // Show a loading indicator while fetching data.
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (categoryController.categories.isNotEmpty) {
                // Display the categories when data is available.
                return ListView.builder(
                  itemCount: categoryController.categories.length,
                  itemBuilder: (context, index) {
                    return
                      Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title:innerHeading(categoryController.categories[index],),
                        ),
                      ),
                    );
                  },
                );
              } else {
                // Handle error state if necessary.
                return Center(
                  child: Text('Failed to load categories'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
