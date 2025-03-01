import 'package:flutter/material.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/domain/session_config.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/domain/session_time.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/sections/scramble_section.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/storage/config_bucket.dart';
import 'package:get/get.dart';
import 'package:revenge_cube/revenge_cube.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) {
        final isTablet = context.isLargeTablet;
        if (!isTablet) return const SizedBox.shrink();

        if (controller.lastTime?.scramble?.situation case final situation?) {
          return Container(
            padding: const EdgeInsets.only(left: 36, right: 36),
            width: 300,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    situation.displayName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RevengeCubeWidget(
                    colors: situation.ui,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (controller.showIMessedUpButton)
                    OutlinedButton(
                      child: Text('Repeat this case'),
                      onPressed: controller.onRepeatCasePressed,
                    ),
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  SessionConfig config = ConfigBucket().config;

  SessionTime? lastTime;

  bool get showIMessedUpButton {
    return ScrambleController.to.config.repeatEachCaseOnce && !ScrambleController.to.config.casesSelected.contains(lastTime?.scramble?.situation);
  }

  void onAddTime(SessionTime time) {
    lastTime = time;
    update();
  }

  @override
  void onReady() {
    ConfigBucket().addListener(configListener);
    super.onReady();
  }

  @override
  void onClose() {
    ConfigBucket().removeListener(configListener);
    super.onClose();
  }

  void configListener() {
    if (config != ConfigBucket().config) {
      config = ConfigBucket().config;
      update();
    }
  }

  void onRepeatCasePressed() {
    ScrambleController.to.repeatCase(lastTime?.scramble?.situation).then((_) {
      update();
    });
  }
}
