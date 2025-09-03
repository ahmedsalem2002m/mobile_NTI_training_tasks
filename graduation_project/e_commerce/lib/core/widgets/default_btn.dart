import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultBtn extends StatelessWidget {
  DefaultBtn({super.key, required this.titleButton, this.textColor = true});

  String titleButton;
  bool? textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Text(
        titleButton,
        style: TextStyle(
          fontSize: 24.sp,
          color: textColor!
              ? APPColors.textColorPrimary
              : APPColors.colorButton,
        ),
      ),
    );
  }
}
