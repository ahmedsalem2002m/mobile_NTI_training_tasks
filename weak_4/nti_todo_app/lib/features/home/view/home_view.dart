import 'package:flutter/material.dart';
import 'package:nti_todo_app/features/home/view/widgets/filled_home_view.dart';
import 'package:nti_todo_app/features/home/view/widgets/empty_home_view%20.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> tasks = [
    "Ahmed"
  ];

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? const EmptyHomeView()
        : FilledHomeView(tasks: tasks);
  }
}
