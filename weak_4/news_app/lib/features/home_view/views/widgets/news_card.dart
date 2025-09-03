import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/news_card_model.dart';

class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.newsCardModel});

  NewsCardModel newsCardModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 269.w,
      height: 324.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            newsCardModel.imagePath!,
            width: 250.w,
            height: 232.h,
            fit: BoxFit.cover,
          ),
          Text(
            newsCardModel.title!,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            newsCardModel.subTitle!,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
