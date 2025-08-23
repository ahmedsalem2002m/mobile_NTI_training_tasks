import 'package:flutter/material.dart';
import 'package:nti_todo_app/features/home/view/widgets/task_group_container.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/group_model.dart';

class ListTaskGroup extends StatelessWidget {
   ListTaskGroup({super.key});
  List<GroupModel> groupTasks = [
    GroupModel(title: "Personal Task", groupIconPath: AppAssets.personalColor, backgroundIcon: AppColors.categoryColor_1,number: "5",numberColor: AppColors.primary),
    GroupModel(title: "Home Task", groupIconPath: AppAssets.homeColor, backgroundIcon: AppColors.categoryColor_2,number: "3",numberColor: AppColors.categoryColorIcon),
    GroupModel(title: "Work Task", groupIconPath: AppAssets.workColor, backgroundIcon: AppColors.black,number: "1",numberColor: AppColors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: groupTasks.length,
        itemBuilder: (context,index)=>TaskGroupContainer(groupModel: groupTasks[index]));
  }
}
