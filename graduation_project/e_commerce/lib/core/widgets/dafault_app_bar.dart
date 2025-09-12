import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAppBarTwo extends StatelessWidget {
  DefaultAppBarTwo({required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back_ios_new_outlined)),
        SizedBox(width: 107.w,),
        Text(
          text,
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400
          ),
        )

      ],
    );
  }
}

// AppBar(
// leading: IconButton(onPressed: (){
// Navigator.pop(context);
// }, icon: SvgPicture.asset(AppAssets.arrowBack)),
// backgroundColor: AppColors.background,
// centerTitle: true,
// title: Text(
// "Settings",
// style: TextStyle(
// fontSize: 19,
// fontWeight: FontWeight.w300
// ),
// ),
// )
