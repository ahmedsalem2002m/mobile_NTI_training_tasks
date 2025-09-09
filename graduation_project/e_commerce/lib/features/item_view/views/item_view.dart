import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_paddings.dart';
import '../../../core/widgets/default_text_form_field.dart';
import '../../home_view/views/widgets/category_item.dart';
import '../../home_view/views/widgets/reco_view.dart';
import '../../home_view/views/widgets/slider.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColorPrimary,
        centerTitle: true,
        title: IconButton
          (
            onPressed: null,
            icon: SvgPicture.asset(AppAssets.splashIcon,height: 39.h,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.appPaddingPrimary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h,),
              Text(
                "All Featured",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black
                ),
              ),
              SizedBox(height: 16.h,),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return CategoryItem();
                    }),
              ),
              SizedBox(height: 12.h,),
              SizedBox(height: 12.h,),
              Text(
                "Products",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black
                ),
              ),
              SizedBox(height: 12.h,),
              ProductGridView(),



            ],
          ),
        ),
      ),
    );
  }
}
