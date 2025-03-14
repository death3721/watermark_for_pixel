import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_me_page.dart';
import 'watermark_setting_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Setting");
    return Scaffold(
      appBar: AppBar(title: const Text("Setting")),
      body: CupertinoListSection.insetGrouped(
        children: <CupertinoListTile>[
          CupertinoListTile(
            title: const Text("Watermark Setting"),
            subtitle: const Text("Setting & Preview"),
            leading: const Icon(Icons.settings_suggest_outlined),
            trailing: const CupertinoListTileChevron(),
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                enableDrag: true,
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return WatermarkSettingPage();
                },
              );
            },
          ),
          CupertinoListTile(
            title: const Text("Text"),
            subtitle: const Text("Text"),
            leading: const Icon(Icons.help_outline_rounded),
            trailing: const CupertinoListTileChevron(),
            onTap: () {
              Get.snackbar('Hi', 'i am a modern snackbar');
            },
          ),
          CupertinoListTile(
            title: const Text("About"),
            subtitle: const Text("About this application"),
            leading: const Icon(Icons.help_outline_rounded),
            trailing: const CupertinoListTileChevron(),
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                enableDrag: true,
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const AboutMePage();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
