// ignore_for_file: must_be_immutable, avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:watermark_for_pixel/common/constant.dart';
import 'package:watermark_for_pixel/common/image_picker.dart';
import 'package:watermark_for_pixel/widget/watermark_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var imagePath = "".obs;

  GetStorage storage = GetStorage();

  // 获取截图组件的key
  final GlobalKey _repaintKey = GlobalKey();

  // 获取截取图片的二进制数据
  Future<Uint8List> _getCurrentImageData() async {
    BuildContext? buildContext = _repaintKey.currentContext;

    RenderRepaintBoundary boundary =
        buildContext!.findRenderObject() as RenderRepaintBoundary;
    // 第一次执行时，boundary.debugNeedsPaint 为 true，此时无法截图（如果为true时直接截图会报错）
    if (boundary.debugNeedsPaint) {
      // 延时一定时间后，boundary.debugNeedsPaint 会变为 false，然后可以正常执行截图的功能
      await Future.delayed(const Duration(milliseconds: 20));
      // 重新调用方法
      return _getCurrentImageData();
    }
    // 获取当前设备的像素比
    double dpr = ui.PlatformDispatcher.instance.implicitView!.devicePixelRatio;
    debugPrint("DPR🍆 = $dpr");
    // pixelRatio 代表截屏之后的模糊程度，因为不同设备的像素比不同
    // 定义一个固定数值显然不是最佳方案，所以以当前设备的像素为目标值
    ui.Image image = await boundary.toImage(pixelRatio: dpr + 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List imageBytes = byteData!.buffer.asUint8List();

    // 返回图片的数据
    return imageBytes;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Home");

    final fontSize = storage.read(Constant.kFontSize);
    final barHight = storage.read(Constant.kBarHight);
    final logoSize = storage.read(Constant.kLogoSize);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pixel Watermark"),
      ),
      body: Obx(
        () => Container(
          padding: const EdgeInsets.all(20),
          color: Colors.grey.shade200,
          height: 100.h,
          child: Center(
            child: SingleChildScrollView(
              child: RepaintBoundary(
                key: _repaintKey,
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      color: Colors.indigo.shade100,
                      child: imagePath.value != ""
                          ? Image.file(
                              File(imagePath.value),
                              fit: BoxFit.fill,
                            )
                          : IconButton(
                              onPressed: () async {
                                imagePath.value = (await getLocalImage());
                              },
                              icon: const Icon(
                                  Icons.add_photo_alternate_outlined),
                              highlightColor: Colors.transparent,
                            ),
                    ),
                    WatermarkWidget(
                      fontSize: fontSize != null
                          ? RxDouble(fontSize)
                          : RxDouble(14.0),
                      barHight: barHight != null
                          ? RxDouble(barHight)
                          : RxDouble(48.0),
                      logoSize: logoSize != null
                          ? RxDouble(logoSize)
                          : RxDouble(18.0),
                    ),
                    Container(
                      height: 100.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        children: [
          const Spacer(),
          FloatingActionButton(
            onPressed: () async {
              // if the user have given the permission
              if (await Permission.storage.request().isGranted) {
                print("have Permission");
                // save the photo into gallary
                Uint8List data = await _getCurrentImageData();
                await ImageGallerySaver.saveImage(data);
              }
            },
            child: const Icon(
              Icons.save_alt_outlined,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          FloatingActionButton(
            onPressed: () async {
              imagePath.value = (await getLocalImage());
            },
            child: const Icon(
              Icons.add_photo_alternate_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
