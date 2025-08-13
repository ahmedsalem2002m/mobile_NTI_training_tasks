import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/core/utils/app_colors.dart';

class CustomRow extends StatelessWidget {
  CustomRow({required this.text,this.show=true});
  String text;
  bool show;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
          ),
         show ? Container(
            alignment: Alignment.center,
            width: 14.w,
            height: 18.h,
            decoration: BoxDecoration(
              color: AppColors.greenGrey,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Text(
              "5",
              style: TextStyle(
                fontSize: 10,
                color: AppColors.primary
              ),
            ),
          ):SizedBox()
        ],
      ),
    );
  }
}
