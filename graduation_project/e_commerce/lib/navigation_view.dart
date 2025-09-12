import 'package:e_commerce/features/item_view/views/item_view.dart';
import 'package:e_commerce/features/profile_view/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_colors.dart';
import 'features/home_view/views/home_view.dart';

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
      backgroundColor: AppColors.textColorPrimary,
      bottomNavigationBar: NavigationBar(
        height: 60,
        backgroundColor: AppColors.textColorPrimary,
        indicatorColor: AppColors.textColorPrimary,
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
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
          return const TextStyle(
            color: AppColors.colorButton,
            fontWeight: FontWeight.bold,
          );
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home_outlined,
              color: AppColors.colorButton,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.colorButton,
            ),
            label: 'Items',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(
              Icons.person_outline,
              color: AppColors.colorButton,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: _buildScreens()[currentPageIndex],
    );
  }

  List<Widget> _buildScreens() {
    return [HomeView(), HomeView(), ProfileView()];
  }
}
