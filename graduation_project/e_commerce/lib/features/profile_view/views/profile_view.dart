import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              buildProfileItem(icon: Icons.person_outline, text: 'My Profile'),
              buildProfileItem(icon: Icons.shopping_bag_outlined, text: 'My Orders'),
              buildProfileItem(icon: Icons.favorite_border, text: 'My Favorites'),
              buildProfileItem(icon: Icons.settings_outlined, text: 'Settings'),

              // Divider
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Divider(color: Colors.pink.shade100),
              ),

              // Log out
              buildProfileItem(icon: Icons.logout, text: 'Log Out'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileItem({required IconData icon, required String text}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
      },
    );
  }
}
