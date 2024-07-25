// ignore_for_file: unused_element, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportsapp/screens/login_screen.dart';
import 'package:sportsapp/widgets/boarding_container.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLastPage = false;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoPlay() {
    const autoPlayDuration = Duration(seconds: 3);
    _timer = Timer.periodic(
      autoPlayDuration,
      (timer) {
        int nextPage = _pageController.page!.round() + 1;
        int totalPages = 3;

        if (nextPage == totalPages) {
          nextPage = 0;
        }
        _pageController.animateToPage(nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      },
    );
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff352F44),
      body: PageView(
        controller: _pageController,
        children: const [
          Boarding(
            imagePass: "assets/images/Basket_ch.png",
            uniSize: .6,
            title:
                'Welcome to Sports app\n\n Join us for the ultimate sports experience.',
          ),
          Boarding(
            imagePass: "assets/images/football_ch.png",
            uniSize: 0.78,
            title: 'Discover the excitement of the world of sports.',
          ),
          Boarding(
            imagePass: "assets/images/baseball_2.png",
            uniSize: .6,
            title: 'You\'re all set to start your sports journey with us!',
          ),
        ],
      ),
      bottomSheet: Container(
        color: const Color(0xff352F44),
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 0.44.sw,
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              onDotClicked: (index) => _goToPage(index),
              effect: WormEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white30,
                dotHeight: 10.h,
                dotWidth: 10.w,
                spacing: 10.w,
              ),
            ),
            SizedBox(
              width: 66.w,
            ),
            ElevatedButton(
                onPressed: () async {
                  // SharedPreferences prefs =
                  // await SharedPreferences.getInstance();
                  // prefs.setBool("isSkipped", true);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                    fixedSize: WidgetStatePropertyAll(Size(100.w, 45.h))),
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                )),
          ],
        ),
      ),
    );
  }
}
