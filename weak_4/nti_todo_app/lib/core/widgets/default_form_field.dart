import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DefaultFormField extends StatefulWidget {
  const DefaultFormField(
      {super.key, this.validator, required this.controller, required this.hintText,
        required this.prefixIcon, this.suffixIcon, this.obscureText = false});

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  InputBorder borderBuilder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
          color: AppColors.lightGrey
      )
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 14,
          color:AppColors.grey
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        border: borderBuilder(),
        focusedBorder: borderBuilder(),
        enabledBorder: borderBuilder(),

      ),

    );
  }
}