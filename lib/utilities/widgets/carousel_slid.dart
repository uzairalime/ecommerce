import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerce/utilities/lists/carousel_slid_list.dart';
import 'package:flutter/material.dart';

class CarouselSlid extends StatelessWidget {
  const CarouselSlid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return CarouselSlider(
      // list slider items
      items: sliderItems.map(
        (e) {
          return Builder(
            builder: (BuildContext context) {
              return SizedBox(
                width: width,
                child: Image.asset(e.imagePath),
              );
            },
          );
        },
      ).toList(),
      // slider options
      options: CarouselOptions(
          autoPlay: false,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          height: height * 0.25,
          // disableCenter: false,
          initialPage: 0,
          viewportFraction: 0.9,
          enableInfiniteScroll: false,

          // pageSnapping: false,
          pauseAutoPlayOnTouch: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height),
    );
  }
}
