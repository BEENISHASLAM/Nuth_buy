
import '../controllers/cart_controller.dart';
import 'package:nuth_buy/exportlinks.dart';
class ProductDetailsView extends StatelessWidget {
CartController cartController = Get.put(CartController());
final double size;
   ProductDetailsView({ this.size = 24.0});
 final data = Get.arguments;
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor:Colors.white,
      appBar: AppBar(
      title: appbarTxt("Details"),
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
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10,),
          Stack(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    data.thumbnail,
                    fit: BoxFit.fill,
                    height:280,
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
      Container(
        decoration:BoxDecoration(
          borderRadius:BorderRadius.only(
              topLeft:Radius.circular(20),
           topRight:Radius.circular(20)),
          color: Colors.white
        ),
        child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      data.brand,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        innerHeading(
                          'Rs: ${data.price.toString()}',

                        ),
                        Text(
                          'In Stock: 94',
                          style: TextStyle(
                              fontSize:15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                Row(
                  children: [
                    StarRating(
            rating:data.rating, // Replace with your actual rating
            starCount: 5, // The total number of stars (default is 5)
            size: 30.0, // Size of each star icon (default is 24.0)
            color: Colors.yellow, // Color of the stars (default is orange)// Alignment of stars (default is start)
          ),
                  ],
                ),
                    SizedBox(height: 16),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                     data.description,
                      style: TextStyle(fontSize:15),
                    ),
                    SizedBox(height: 16),
                        Center(
                          child: Container(
          width: 200,
          child: Button(label: 'Add to cart',onTap:(){

  cartController.cartadd(data);
  Get.toNamed('/cartScreen');
     },),),
                        )
                  ],
                ),
              ),
      ),
        ],
      ),
    ),
  );
}
}




class StarRating extends StatelessWidget {
final double rating;
final int starCount;
final double size;
final Color color;
final MainAxisAlignment mainAxisAlignment;

StarRating({
  required this.rating,
  this.starCount = 5,
  this.size = 24.0,
  this.color = Colors.orange,
  this.mainAxisAlignment = MainAxisAlignment.start,
});

@override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: List.generate(
      starCount,
          (index) {
        return Icon(
          index < rating
              ? Icons.star
              : index - rating < 0.5
              ? Icons.star_half
              : Icons.star_border,
          size: size,
          color: color,
        );
      },
    ),
  );
}
}
