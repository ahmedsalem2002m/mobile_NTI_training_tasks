import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class DefaultText extends StatelessWidget {
  DefaultText({super.key,required this.text_1,required this.text_2,this.onTap});
  String text_1;
  String text_2;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$text_1 Have An Account?",
          style: TextStyle(
              color: AppColors.textColorThird
          ),
        ),
        SizedBox(width: 32,),
        TextButton(
          onPressed: onTap,
          child: Text(
            text_2,
            style: TextStyle(
              color: AppColors.black,

            ),
          ),
        ),
      ],
    );
  }
}
