import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/core/helper/app_navigator.dart';
import 'package:nti_todo_app/features/home/cubit/user_cubit.dart';
import 'package:nti_todo_app/features/home/view/widgets/default_floating_action.dart';
import 'package:nti_todo_app/features/login/data/model/login_model.dart';
import 'package:nti_todo_app/features/login/view/login_view.dart';
import '../../../../core/utils/app_paddings.dart';
import '../../../../core/widgets/default_app_bar.dart';
import '../../cubit/user_state.dart';
import 'custom_row.dart';
import 'list_category_task.dart';
import 'list_task_group.dart';
import 'progress_container.dart';

class FilledHomeView extends StatelessWidget {
  const FilledHomeView({super.key, required this.tasks,this.userModel});
  final List<String> tasks;
  final UserModel? userModel;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context)=>UserCubit()..controlUser(userModel),
        child: Builder(
          builder: (context){
            return Scaffold(
              floatingActionButton: DefaultFloatingAction(),
              body: SingleChildScrollView(
                child: BlocConsumer<UserCubit,UserState>(
                  listener: (context,state){

                  },
                  builder: (context , state){

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppPaddings.defaultHomePadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultAppBar(name: state is UserSuccess? state.userModel.name:"unknow",),
                              SizedBox(height: 34.h),
                              ProgressContainer(),
                              SizedBox(height: 26.h),
                              CustomRow(text: "In Progress"),
                              SizedBox(height: 23.h),
                            ],
                          ),
                        ),
                        ListCategoryTask(),
                        Padding(
                          padding: AppPaddings.defaultHomePadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 26.h),
                              CustomRow(text: "Task Groups", show: false),
                              SizedBox(height: 23.h),
                              ListTaskGroup(),
                              IconButton(onPressed: (){
                                FirebaseAuth.instance.signOut();
                                AppNavigator.goTo(context, LoginView(),type: NavigatorType.pushAndRemoveUntil);
                              }, icon: Text("Log out"))
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
