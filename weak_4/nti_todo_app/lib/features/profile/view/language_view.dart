import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/core/utils/app_colors.dart';
import 'package:nti_todo_app/core/utils/app_paddings.dart';

class LanguageView extends StatefulWidget {
   LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  bool showLan = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: SvgPicture.asset(AppAssets.arrowBack)),
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w300
          ),
        ),
      ),
      body: Padding(
        padding: AppPaddings.defaultHomePadding,
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Language",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          showLan = !showLan;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 51.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(5.r),bottomLeft:Radius.circular(5.r)),
                          color: showLan?AppColors.light:AppColors.primary
                        ),
                        child: Text(
                          "AR",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          showLan = !showLan;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 51.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight:Radius.circular(5.r),bottomRight:Radius.circular(5.r)),
                          color: showLan?AppColors.primary:AppColors.light
                        ),
                        child: Text(
                          "EN",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
