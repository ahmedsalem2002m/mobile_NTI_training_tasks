import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce/features/login_view/views/login_view.dart';
import 'package:e_commerce/core/helper/app_navigator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                'Profile',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),

              // Avatar
              CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.pink[100],
                backgroundImage: AssetImage('assets/images/category_image.jpg'),
              ),
              SizedBox(height: 8.h),

              // Username
              Text(
                'User full Name',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.pink,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),

              // List of items
              buildProfileItem(context, icon: Icons.person_outline, text: 'My Profile'),
              buildProfileItem(context, icon: Icons.shopping_bag_outlined, text: 'My Orders'),
              buildProfileItem(context, icon: Icons.favorite_border, text: 'My Favorites'),
              buildProfileItem(context, icon: Icons.settings_outlined, text: 'Settings'),

              // Divider
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Divider(color: Colors.pink.shade100),
              ),

              // Log out
              buildProfileItem(context, icon: Icons.logout, text: 'Log Out'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileItem(BuildContext context, {required IconData icon, required String text}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () async {
        if (text == 'Log Out') {
          // 1️⃣ مسح بيانات تسجيل الدخول
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('access_token');
          // امسح أي بيانات تانية هنا إذا عندك

          // 2️⃣ ارجع لشاشة تسجيل الدخول
          AppNavigator.goTo(
            context,
            const LoginView(),
            type: NavigatorType.pushReplacement,
          );
        }
      },
    );
  }
}
