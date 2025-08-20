import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper/my_navigator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../add_task/view/add_task_view.dart';

class DefaultFloatingAction extends StatelessWidget {
  const DefaultFloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        goTo(context, AddTaskView());
      },
      backgroundColor: AppColors.primary,
      child: SvgPicture.asset(AppAssets.addTaskIcon, width: 24, height: 24),
    );
  }
}
