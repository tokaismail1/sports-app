// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sportsapp/screens/home_screen.dart';
import 'package:sportsapp/screens/login_screen.dart';
import 'package:sportsapp/screens/onboarding_screen.dart';
import 'package:sportsapp/screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      checkOnbardingIsSkipped();
      checkLoginStatus();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });

    super.initState();
  }

  Future<void> checkOnbardingIsSkipped() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isSkipped") == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    }
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isLoggedIn") == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeScreen(
          phoneNumber: prefs.getString("phoneNum")!,
        );
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff352F44), Color(0xffB9B4C7)],
                begin: Alignment.topRight,
                end: Alignment.topLeft)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: 300,
              width: 300,
            )
          ],
        ),
      ),
    );
  }
}
