// ignore_for_file: avoid_print

import 'package:image_picker/image_picker.dart';

/// 图片选取
Future<String> getLocalImage() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.gallery, // 图库选择
    // maxWidth: 1000.0, // 设置图片最大宽度，间接压缩了图片的体积
    imageQuality: 100,
  );

  /// 选取图片失败file为null，要注意判断下。
  /// 获取图片路径后可以上传到服务器上
  if (file == null) {
    return "";
  }
  return file.path;
}
