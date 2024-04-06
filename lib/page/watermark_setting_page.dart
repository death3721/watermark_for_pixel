// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:watermark_for_pixel/common/constant.dart';
import 'package:watermark_for_pixel/widget/watermark_widget.dart';
import 'package:get_storage/get_storage.dart';

class WatermarkSettingPage extends StatelessWidget {
  WatermarkSettingPage({super.key});

  final fontSizeProgress = 12.0.obs;
  final barHightProgress = 48.0.obs;
  final logoSizeProgress = 18.0.obs;

  GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      height: 50.h,
      width: 100.w,
      child: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
              child: WatermarkWidget(
                fontSize: fontSizeProgress,
                barHight: barHightProgress,
                logoSize: logoSizeProgress,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20.0),
              child: const Text(
                "Font Size",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Slider(
                value: fontSizeProgress.value,
                min: 10.0,
                max: 14.0,
                divisions: 4,
                label: '$fontSizeProgress',
                onChanged: (value) {
                  fontSizeProgress.value = value;
                  storage.write(Constant.kFontSize, value);
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20.0),
              child: const Text(
                "Bar Hight",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Slider(
                value: barHightProgress.value,
                min: 44.0,
                max: 56.0,
                divisions: 6,
                label: '$barHightProgress',
                onChanged: (value) {
                  barHightProgress.value = value;
                  storage.write(Constant.kBarHight, value);
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20.0),
              child: const Text(
                "Logo Size",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Slider(
                value: logoSizeProgress.value,
                min: 14.0,
                max: 18.0,
                divisions: 4,
                label: '$logoSizeProgress',
                onChanged: (value) {
                  logoSizeProgress.value = value;
                  storage.write(Constant.kLogoSize, value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
