import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class DefaultDropdownBtn extends StatelessWidget {
  const DefaultDropdownBtn({super.key});

  InputBorder borderBuilder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
          color: AppColors.lightGrey
      )
  );

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      style: TextStyle(
        color: AppColors.grey,
            fontSize: 14.sp

      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: borderBuilder(),
        focusedBorder: borderBuilder(),
        enabledBorder: borderBuilder()
      ),
      icon: SvgPicture.asset(AppAssets.dropdownArrow),
      hint:Text(
        "Group"
      ) ,
      items: [
        DropdownMenuItem(
          value: "Home",
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.h),
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColors.categoryColor_2,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: SvgPicture.asset(AppAssets.homeColor),
              ),
              SizedBox(width: 12),
              Text("Home"),
            ],
          ),
        ),
        DropdownMenuItem(
          value: "Personal",
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.h),
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: SvgPicture.asset(AppAssets.personal),
              ),
              SizedBox(width: 12),
              Text("Personal"),
            ],
          ),
        ),
        DropdownMenuItem(
          value: "Work",
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.h),
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: SvgPicture.asset(AppAssets.work),
              ),
              SizedBox(width: 12),
              Text("Work"),
            ],
          ),
        ),
      ],
      onChanged: (value) {
        print(value);
      },
    );
  }
}
