import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'page/bottom_navigation_bar.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      home: BottomNavigationBarPage(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
    ),
  );
}
