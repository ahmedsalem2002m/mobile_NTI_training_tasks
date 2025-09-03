import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/explore_view/views/explore_view.dart';
import 'package:news_app/features/home_view/views/home_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      bottomNavigationBar: NavigationBar(
        height: 60,
        backgroundColor: AppColors.navigationColor,
        // surfaceTintColor: Colors.transparent,
        indicatorColor: AppColors.textPrimary,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide.none,
        ),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.language_outlined),
            selectedIcon: Icon(Icons.language, color: Colors.white),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite, color: Colors.white),
            label: 'Bookmark',
          ),
          NavigationDestination(
            icon: Icon(Icons.wb_sunny_outlined),
            selectedIcon: Icon(Icons.wb_sunny, color: Colors.white),
            label: 'Weather',
          ),
        ],
      ),
      body: _buildScreens()[currentPageIndex],
    );
  }

  List<Widget> _buildScreens() {
    return [
       HomeView(),
       ExploreView(),
       HomeView(),
       HomeView(),
    ];
  }
}
