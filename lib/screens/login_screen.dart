// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportsapp/cubits/login_loading/login_loading_cubit.dart';
import 'package:sportsapp/global/global.dart';
import 'package:sportsapp/helpers/update_login_status.dart';
import 'package:sportsapp/screens/home_screen.dart';
import 'package:sportsapp/widgets/custom_buttton.dart';
import 'package:sportsapp/widgets/cutom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String otpNumber = '';
  bool isLoading = false; // Added to manage loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF352F44),
                Color(0xFFFAF0E6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 36.0.h, horizontal: 24.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Enter a Beautiful Place",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Form(
                  key: formKey,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFAF0E6),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30.0).r,
                          topRight: const Radius.circular(30.0).r,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0).r,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomTextFormField(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey[600],
                            ),
                            hintText: "Phone Number",
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            onChanged: (p0) {
                              phoneNumber = p0;
                            },
                            validator: (data) {
                              if (data!.isEmpty) {
                                return "Phone Number is required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          CustomTextFormField(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[600],
                            ),
                            hintText: "OTP",
                            keyboardType: TextInputType.number,
                            controller: otpController,
                            validator: (data) {
                              if (data!.isEmpty) {
                                return "OTP is required";
                              }
                              if (data != otpNumber) {
                                return "OTP is not valid";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30.0.h,
                          ),
                          CustomButton(
                            label: Text("Generate OTP",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 18.sp)),
                            onPressed: () {
                              Random random = Random();
                              String randomDigits = '';

                              for (int i = 0; i < 4; i++) {
                                randomDigits += random.nextInt(10).toString();
                              }

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("OTP"),
                                    contentTextStyle: TextStyle(
                                      fontSize: 24.0.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    content: Text(
                                      randomDigits,
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          FocusScope.of(context).unfocus();

                                          otpNumber = randomDigits;
                                        },
                                        child: const Text("OK",
                                            style: TextStyle(
                                              color: Colors.red,
                                            )),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          CustomButton(
                            label: BlocBuilder<LoginLoadingCubit, LoginLoadingState>(
                              builder: (context, state) {
                                return isLoading == false
                                    ? Text("Login by using OTP",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18.sp))
                                    : SizedBox(
                                        height: 25.h,
                                        width: 25.w,
                                        child: const CircularProgressIndicator(
                                          color: Colors.black87,
                                        ),
                                      );
                              },
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });

                                BlocProvider.of<LoginLoadingCubit>(context)
                                    .isloading();

                                Timer(const Duration(seconds: 3), () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen(
                                                phoneNumber: phoneController.text,
                                              )));

                                  phoneController.clear();
                                  otpController.clear();
                                  updateLoginStatus(true);

                                  // Show SnackBar after login
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(
                                        child: Text(
                                          "${phoneController.text} is logged in successfully",
                                          style: const TextStyle(color: Color(0xFF5C5470)),
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );

                                  setState(() {
                                    isLoading = false;
                                  });

                                  BlocProvider.of<LoginLoadingCubit>(context)
                                      .isloading();
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: 30.0.h,
                          ),
                          CustomButton(
                            label: Text(
                              "Login by using Google",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18.sp),
                            ),
                            onPressed: () {
                              // Add Google login functionality here
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
