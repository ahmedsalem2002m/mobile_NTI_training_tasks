import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/home_view/views/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavigatorBar extends StatelessWidget {
  NavigatorBar({super.key});

  final NavBarStyle _navBarStyle = NavBarStyle.style10;

  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [HomeView(), HomeView(),HomeView(),HomeView()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: "Home",
        textStyle: TextStyle(color: Colors.white),
        activeColorPrimary: AppColors.textPrimary,
        inactiveColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: "Home",
        textStyle: TextStyle(color: Colors.white),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: "Home",
        textStyle: TextStyle(color: Colors.white),
        activeColorPrimary: AppColors.textPrimary,
        inactiveColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: "Home",
        textStyle: TextStyle(color: Colors.white),
        activeColorPrimary: AppColors.textPrimary,
        inactiveColorPrimary: AppColors.primary,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      backgroundColor: AppColors.navigationColor,
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: _navBarStyle,
    );
  }
}
