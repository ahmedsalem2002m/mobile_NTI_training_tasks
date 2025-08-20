import 'package:flutter/material.dart';
import 'package:nti_todo_app/core/helper/my_navigator.dart';
import 'package:nti_todo_app/core/utils/app_assets.dart';
import 'package:nti_todo_app/features/login/view/login_view.dart';

import '../../../register/view/register_view.dart';

class LetsStartView extends StatelessWidget {
  const LetsStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 300,
                width: 200,
                child: Image.asset(
                  AppAssets.letStart,
                  // fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Welcome To\nDo It !",
                    style: TextStyle(
                        color:Color(0xff24252C),fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "Ready to conquer your tasks? Let's Do\n It together.",
                    style: TextStyle(
                      color: Color(0xff6E6A7C),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      color: Color(0xff149954),
                      onPressed: () {
                        goTo(context, LoginView());
                      },
                      child: Text(
                        textAlign: TextAlign.center,
                        "Let's Start",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
