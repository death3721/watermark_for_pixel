// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import '../common/google_logo.dart';

class WatermarkWidget extends StatelessWidget {
  WatermarkWidget({
    super.key,
    required this.fontSize,
    required this.barHight,
    required this.logoSize,
  });

  var fontSize = 12.0.obs;
  var barHight = 48.0.obs;
  var logoSize = 18.0.obs;

  final fontColor = Colors.black;
  final barColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: barColor,
      height: barHight.value,
      width: 100.w,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Google Pixel 7a",
                  style: TextStyle(
                    color: fontColor,
                    fontSize: fontSize.value,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "2024.03.18 17:26:45",
                  style: TextStyle(
                    color: fontColor,
                    fontSize: fontSize.value - 4.0,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: logoSize.value,
            height: logoSize.value,
            child: const GoogleLogo(),
          ),
          const SizedBox(width: 10.0),
          Container(
            width: 0.5,
            margin: const EdgeInsets.fromLTRB(0, 14, 0, 14),
            color: Colors.grey.shade400,
          ),
          const SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "25mm f/1.89 1/50 ISO56",
                  style: TextStyle(
                    color: fontColor,
                    fontSize: fontSize.value - 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "25mm f/1.89 1/50 ISO56",
                  style: TextStyle(
                    color: fontColor,
                    fontSize: fontSize.value - 4.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
