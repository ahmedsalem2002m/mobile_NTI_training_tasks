import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/app_navigator.dart';
import '../../../core/widgets/default_btn.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final List<Map<String, dynamic>> products = [
    {
      'name': "Women's Casual Wear",
      'rating': 4.8,
      'items': 1,
      'price': 34.0,
      'oldPrice': 64.0,
      'image':
      'https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?auto=format&fit=crop&w=400&q=80',
    },
    {
      'name': "Men's Jacket",
      'rating': 4.7,
      'items': 1,
      'price': 45.0,
      'oldPrice': 67.0,
      'image':
      'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?auto=format&fit=crop&w=400&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColorPrimary,
        title: Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            AppNavigator.goBack(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.network(
                                  product['image'],
                                  width: 80.w,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['name'],
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.amber, size: 16.sp),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "${product['rating']}",
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "${product['items']} item${product['items'] > 1 ? 's' : ''}",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$${product['price']}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "\$${product['oldPrice']}",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                        decoration:
                                        TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Total Order (${product['items']}): \$${product['price']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              color: AppColors.colorButton,
              child: DefaultBtn(titleButton: "Place Order",),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
