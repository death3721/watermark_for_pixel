// https://github.com/death3721

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 30.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Image.asset(
              "images/avatar.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text("Copyright © 2024 death3721."),
          const Text("All Rights Reserved.")
        ],
      ),
    );
  }
}
