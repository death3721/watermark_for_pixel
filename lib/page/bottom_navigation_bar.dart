import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_page.dart';
import 'setting_page.dart';

class BottomNavigationBarPage extends StatelessWidget {
  BottomNavigationBarPage({super.key});

  final _pageWidgets = [
    HomePage(),
    const SettingPage(),
  ];

  final _selectedIndex = 0.obs;

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: _onItemTapped,
          selectedIndex: _selectedIndex.value,
          height: 64,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const <Widget>[
            NavigationDestination(
                icon: Icon(Icons.photo_camera), label: 'Photo'),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined), label: 'Setting'),
          ],
        ),
        body: _pageWidgets[_selectedIndex.value],
      ),
    );
  }
}
