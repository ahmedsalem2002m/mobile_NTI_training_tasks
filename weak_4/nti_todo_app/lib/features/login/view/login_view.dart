import 'package:flutter/material.dart';
import 'package:nti_todo_app/core/widgets/default_form_field.dart';
import 'package:nti_todo_app/features/register/view/register_view.dart';
import 'package:nti_todo_app/features/register/view/widgets/defualt_text.dart';

import '../../../../core/widgets/default_btn.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  bool lock_1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/flag.png"),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  spacing: 8,
                  children: [
                    DefaultFormField(
                      controller: password,
                      hintText: "Username",
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    DefaultFormField(
                      obscureText: lock_1,
                      suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              lock_1 = !lock_1;
                            });
                          },
                          child: Icon(lock_1 ? Icons.lock_outline:Icons.lock_open_outlined)),
                      controller: userName,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.key_outlined),
                    ),
                    SizedBox(height: 4),
                    DefaultBtn(onPressed: () {}, text: "Login"),
                    DefaultText(text_2: "Register",text_1: "Don't",onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterView()));
                    },),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
