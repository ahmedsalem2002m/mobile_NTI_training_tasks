import 'package:flutter/material.dart';
import 'package:nti_todo_app/core/helper/my_navigator.dart';
import 'package:nti_todo_app/features/profile/view/widgets/setting_item.dart';

import '../../../../core/utils/app_assets.dart';
import '../../data/setting_model.dart';
import '../change_password_view.dart';
import '../language_view.dart';
import '../update_profile_view.dart';

class ListSetting extends StatelessWidget {
   ListSetting({super.key});


  @override
  Widget build(BuildContext context) {
    List<SettingModel> settingList = [
      SettingModel(preIconPath: AppAssets.profileIcon, title: "Profile",onTap:()=>goTo(context, UpdateProfileView())),
      SettingModel(preIconPath: AppAssets.keyIcon, title: "Change Password",onTap:()=>goTo(context, ChangePasswordView())),
      SettingModel(preIconPath: AppAssets.setting, title: "Settings",onTap:()=>goTo(context, LanguageView())),

    ];
    return Expanded(
      child: ListView.builder(
          itemCount: settingList.length,
          itemBuilder: (context,index)=>SettingItem(settingModel: settingList[index],)),
    );
  }
}

