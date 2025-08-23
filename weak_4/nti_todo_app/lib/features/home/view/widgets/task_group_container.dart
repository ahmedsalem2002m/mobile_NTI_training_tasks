import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_todo_app/features/home/data/models/group_model.dart';

import '../../../../core/utils/app_colors.dart';

class TaskGroupContainer extends StatelessWidget {
   TaskGroupContainer({required this.groupModel});
  GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 63.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.r)
          ),
          padding: REdgeInsets.symmetric(
              horizontal: 14.sp,
              vertical: 16.sp
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.h),
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        color: groupModel.backgroundIcon,
                        borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: SvgPicture.asset(groupModel.groupIconPath),
                  ),
                  SizedBox(width: 11.w,),
                  Text(
                    groupModel.title,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: 14.w,
                height: 18.h,
                decoration: BoxDecoration(
                    color: groupModel.backgroundIcon,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text(
                  groupModel.number,
                  style: TextStyle(
                      fontSize: 10,
                      color: groupModel.numberColor
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 17.h,)
      ],
    );
  }
}