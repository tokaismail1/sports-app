import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff352F44),Color(0xffB9B4C7)],
          begin: Alignment.topRight,
          end: Alignment.topLeft)
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/logo.png'),height:300 ,width: 300,)
          ],
        ),

      ) ,

    );
  }
}