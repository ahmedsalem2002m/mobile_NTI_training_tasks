import 'package:flutter/material.dart';
import 'package:nti_todo_app/features/home/view/temp_home.dart';
import 'package:nti_todo_app/features/home/view/widgets/filled_home_view.dart';
import 'package:nti_todo_app/features/home/view/widgets/empty_home_view%20.dart';
import 'package:nti_todo_app/features/login/data/model/login_response_model.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key,this.userModel});
UserModel? userModel;
  List<String> tasks = [
    "Ahmed"
  ];

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ?  EmptyHomeView()
        : FilledHomeView(userModel: userModel,);
  }
}
