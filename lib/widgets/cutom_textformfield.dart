import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Function(String)? onsubmited;
  final TextInputType? keyboardType;
  // final Color bordercolor;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.controller,
    this.validator,
    this.onsubmited,
    this.keyboardType,
    // this.bordercolor = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      onFieldSubmitted: onsubmited,
      onChanged: onChanged,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 20.w,
        ),
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFB5ABAD),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(30).r,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30).r,
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(30).r,
        ),
      ),
    );
  }
}
