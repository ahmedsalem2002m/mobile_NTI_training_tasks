import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/category_model.dart';
import 'category_task_container.dart';

class ListCategoryTask extends StatelessWidget {
   ListCategoryTask({super.key});
  List<CategoryModel_todo> category = [
    CategoryModel_todo(
      categoryIconPath: AppAssets.work,
      colorCategory: AppColors.black,
      title: "Work Task",
      description: "Add New Features",
      iconColor: AppColors.primary,
      textColor: AppColors.white,
    ),
    CategoryModel_todo(
      categoryIconPath: AppAssets.personal,
      colorCategory: AppColors.categoryColor_1,
      title: "Personal Task",
      description: "Improve my English skills by trying to speek",
      iconColor: AppColors.primary,
      textColor: AppColors.grey,
    ),

    CategoryModel_todo(
      categoryIconPath: AppAssets.home,
      colorCategory: AppColors.categoryColor_2,
      title: "Home Task",
      description: "Add new feature for Do It app and commit it",
      iconColor: AppColors.categoryColorIcon,
      textColor: AppColors.grey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) =>
            CategoryTaskContainer(categoryModel: category[index]),
      ),
    );
  }
}
