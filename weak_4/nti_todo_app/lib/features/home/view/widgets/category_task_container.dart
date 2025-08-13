import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_todo_app/core/utils/app_paddings.dart';
import 'package:nti_todo_app/features/home/data/category_model.dart';


class CategoryTaskContainer extends StatelessWidget {
  CategoryTaskContainer({required this.categoryModel});

  CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.defaultSecondHomePadding,
      child: Container(
        width: 234.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: categoryModel.colorCategory,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: REdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryModel.title,
                  style: TextStyle(
                    color: categoryModel.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3.h),
                  width: 22.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                    color: categoryModel.iconColor,
                    borderRadius: BorderRadius.circular(5.r)
                  ),
                  child: SvgPicture.asset(categoryModel.categoryIconPath),
                ),
              ],
            ),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              categoryModel.description,
              style: TextStyle(
                color: categoryModel.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
