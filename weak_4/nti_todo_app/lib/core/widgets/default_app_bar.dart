import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../features/profile/view/profile_view.dart';
import '../helper/my_navigator.dart';

class DefaultAppBar extends StatelessWidget {
   DefaultAppBar();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => goTo(context, ProfileView()),
      child: Column(
        children: [
          SizedBox(height: 8.h,),
          Row(
            children:
            [
              CircleAvatar(
                backgroundImage: AssetImage(AppAssets.flag),
                radius: 30.r,
              ),
              SizedBox(
                width: 18.0.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text('Hello'),
                    Text('Ahmed Salem',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}