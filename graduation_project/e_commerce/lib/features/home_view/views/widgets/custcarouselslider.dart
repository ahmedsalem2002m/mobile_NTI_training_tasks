import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custcarouselslider extends StatelessWidget {
  final List<String> items;
  final Function(int, CarouselPageChangedReason) index;
  const Custcarouselslider({super.key, required this.items, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: index,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            height: 180,
            enlargeCenterPage: true,
          ),
          items: items.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15.r),
                  child:    Image.asset(i, fit: BoxFit.contain, width: double.infinity)
                
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}