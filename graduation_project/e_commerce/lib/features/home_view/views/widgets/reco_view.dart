import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product_details_view/views/product_details_view.dart';


class ProductGridView extends StatelessWidget {
  final List<Map<String, String>> products = List.generate(
    10,
        (index) => {
      'title': 'Mens Starry',
      'description': 'Mens Starry Sky Printed Shirt\n100% Cotton Fabric',
      'price': '100',
      'image': 'assets/images/reco_image.png',
      'reviews': '1,52,344',
    },
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 0.48,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailsScreen(
                  title: product['title']!,
                  description: product['description']!,
                  price: product['price']!,
                  image: product['image']!,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.r,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  child: Image.asset(
                    product['image']!,
                    height: 230.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['title']!,
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        product['description']!,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '${product['price']} \$',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Row(
                            children: List.generate(5, (i) {
                              return Icon(Icons.star, color: Colors.amber, size: 14.sp);
                            }),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            product['reviews']!,
                            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
