import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/login/data/model/login_response_model.dart';
import '../../features/profile/view/profile_view.dart';
import '../helper/app_navigator.dart';
import '../utils/app_assets.dart';

class DefaultAppBar extends StatelessWidget {
  final UserModel userModel;

  const DefaultAppBar({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigator.goTo(
        context,
        ProfileView(userModel: userModel),
      ),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: userModel.imagePath != null && userModel.imagePath!.isNotEmpty
                    ? NetworkImage(userModel.imagePath!)
                    : AssetImage(AppAssets.flag) as ImageProvider,
                radius: 30.r,
              ),
              SizedBox(width: 18.0.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello'),
                    Text(
                      userModel.name!,
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
