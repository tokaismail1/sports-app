import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Widget? icon;
  final Widget? label;
  const CustomButton(
      {super.key, this.text, this.onPressed, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton.icon(
        icon: icon,
        onPressed: onPressed,
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(500.w, 42.h)),
          elevation: const WidgetStatePropertyAll(7),
          backgroundColor: const WidgetStatePropertyAll(Colors.grey),
        ),
        label: label!,
      ),
    );
  }
}
