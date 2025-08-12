import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135.h,
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30.r)
      ),
      padding: REdgeInsets.symmetric(
          horizontal: 22,
          vertical: 18
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          Text('Your today’s tasks almost done!',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400

            ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [
              Text('80%',style: TextStyle(
                  color: AppColors.white,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w500

              ),) ,
              Text('View Tasks',style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500

              ),)
            ],
          )

        ],
      ),
    );
  }
}