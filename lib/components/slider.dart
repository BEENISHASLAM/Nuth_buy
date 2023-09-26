import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class StackedCardCarousel extends StatefulWidget {
  @override
  _StackedCardCarouselState createState() => _StackedCardCarouselState();
}

class _StackedCardCarouselState extends State<StackedCardCarousel> {
  final List<String> imagePaths = [
    'assets/images/6.gif',
    'assets/images/7.gif',
    'assets/images/8.gif',
    'assets/images/9.gif',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        itemCount: imagePaths.length,
        options: CarouselOptions(
          autoPlay: true,  // Enable auto-play
          enlargeCenterPage: true,
          aspectRatio: 19 /8,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: double.infinity,
            //margin: EdgeInsets.symmetric(horizontal:1.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(imagePaths[index],),
                fit: BoxFit.cover,

              ),
            ),
          );
        },
      ),
    );
  }
}
