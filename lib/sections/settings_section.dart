import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) {
        return Container();
      },
    );
  }
}

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();
}
