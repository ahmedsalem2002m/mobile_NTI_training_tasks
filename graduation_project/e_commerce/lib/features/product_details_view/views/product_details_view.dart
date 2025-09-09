import 'package:e_commerce/core/helper/app_navigator.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/default_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String image;

  const ProductDetailsScreen({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: AppColors.textColorPrimary,
        title: Text('Product',
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            AppNavigator.goBack(context);
          },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 400.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.favorite_border, color: Colors.red),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              description,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$price \$',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove, color: Colors.pink)),
                    Text('1', style: TextStyle(fontSize: 16.sp)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add, color: Colors.pink)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Container(
              width: double.infinity,
              height: 55,
              color: AppColors.colorButton,
              child: DefaultBtn(
                titleButton: "Add to Cart",
                // onPressed: () {
                //   RegisterCubit.get(
                //     context,
                //   ).onRegisterPressed();
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
