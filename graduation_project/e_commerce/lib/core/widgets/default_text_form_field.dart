import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class DefaultTexFormField extends StatefulWidget {
  const DefaultTexFormField({
    super.key,
    this.validator,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
  });

  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;

  @override
  State<DefaultTexFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultTexFormField> {
  InputBorder borderBuilder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: AppColors.textColorThird),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.h,
      child: TextFormField(
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        // minLines: 1,
        // maxLines: null,
        // keyboardType: TextInputType.multiline,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.textHint),
          fillColor: AppColors.texFormColor,
          filled: true,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          border: borderBuilder(),
          focusedBorder: borderBuilder(),
          enabledBorder: borderBuilder(),
        ),
      ),
    );
  }
}
