import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      width: size.width * 0.85,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          Container(
            width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 18,color: Colors.grey,letterSpacing: 1.5)
                ),
              ),
          ),

        ],
      ),
    );
  }
}
