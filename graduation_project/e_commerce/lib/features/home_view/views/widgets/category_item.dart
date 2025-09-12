import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/features/home_view/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class CategoryItem extends StatelessWidget {
   CategoryItem({super.key,required this.categoryModel,required this.onTap});
  CategoryModel categoryModel;
   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 71.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(categoryModel.imagePath??"https://www.google.com/url?sa=i&url=https%3A%2F%2Ficon-library.com%2Ficon%2Fcategory-icon-6.html&psig=AOvVaw0nqwXjocByl7HEf67H44Bn&ust=1757734677090000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCLCOwJGm0o8DFQAAAAAdAAAAABAE"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              categoryModel.title??"Category",
              style: TextStyle(fontSize: 12.sp),
            )
          ],
        ),
      ),
    );
  }
}

