import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Boarding extends StatelessWidget {
  final String imagePass;
  final String title;
  final double uniSize;

  const Boarding({
    super.key,
    required this.uniSize,
    required this.imagePass,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
              flex: 6,
              child: Center(
                child: Image.asset(
                  imagePass,
                  height: MediaQuery.of(context).size.height * uniSize.h,
                  width: MediaQuery.of(context).size.width * uniSize.w,
                ),
              )),
          SizedBox(
            height: 15.h,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
