import 'package:flutter/material.dart';
import 'package:fourtrainer/domain/session_config.dart';
import 'package:fourtrainer/domain/session_time.dart';
import 'package:get/get.dart';
import 'package:revenge_cube/revenge_cube.dart';

import '../storage/config_bucket.dart';
import '../util/dialog.dart';
import 'case_selection_section.dart';

class ScrambleSection extends StatelessWidget {
  const ScrambleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScrambleController>(
      init: ScrambleController(),
      builder: (controller) {
        final isTablet = context.isTablet;
        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: controller.isScrambleVisible
              ? Container(
                  padding: isTablet ? const EdgeInsets.all(36) : const EdgeInsets.all(8),
                  width: double.infinity,
                  height: isTablet ? 200 : 120,
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              BackButton(
                                onPressed: () {
                                  controller.toggleScrambleVisibility();
                                },
                              ),
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                    child: Text(
                                      controller.scramble?.scramble ?? 'Select something to 🚂 on',
                                      style: isTablet
                                          ? Theme.of(context).textTheme.displaySmall
                                          : Theme.of(context).textTheme.labelLarge,
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                iconSize: 32,
                                icon: const Icon(Icons.refresh),
                                onPressed: controller.onRefreshScramble,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        Text('You have selected ${controller.config.casesSelected.length} cases'),
                      ],
                    ),
                  ),
                )
              : const CaseSelection(),
        );
      },
    );
  }
}

class ScrambleController extends GetxController {
  static ScrambleController get to => Get.find();

  bool isScrambleVisible = false;

  SessionConfig config = ConfigBucket().config;

  SessionConfig? configOrigin;

  RevengeScramble? scramble;
  RevengeScramble? lastScramble;

  final RevengeScrambler _scrambler = RevengeScrambler();

  final configStorageKey = 'scrambleControllerData';

  @override
  void onReady() {
    ConfigBucket().addListener(configListener);
  }

  @override
  void onClose() {
    ConfigBucket().removeListener(configListener);
    super.onClose();
  }

  void configListener() {
    final configFromStorage = ConfigBucket().config;
    config = configFromStorage;
    scramble = _scrambler.generateScramble(
      casesSelected: config.casesSelected.toList(),
      randomizeAuf: config.randomizeAuf,
    );
    isScrambleVisible = scramble != null;
    update();
  }

  void toggleScrambleVisibility() {
    isScrambleVisible = !isScrambleVisible;
    update();
  }

  void generateNewScramble() {
    lastScramble = scramble;
    if (config.repeatEachCaseOnce) {
      config = config.removeCases([lastScramble!.situation!]);
    }

    scramble = _scrambler.generateScramble(
      casesSelected: config.casesSelected.toList(),
      randomizeAuf: config.randomizeAuf,
    );

    update();
  }

  void onAddTime(BuildContext context, SessionTime time) {
    if (config.repeatEachCaseOnce && configOrigin == null) {
      configOrigin = config;
    }

    if (config.repeatEachCaseOnce && config.casesSelected.length != 1) {
      updateScrambleConfig(
        config.removeCases([time.scramble!.situation!]),
      );
    } else if (config.casesSelected.length == 1 && config.repeatEachCaseOnce) {
      DialogHandler().optionDialog(
        context,
        title: 'All cases repeated',
        content: 'You have done all the cases selected. Do you want to do them again?',
        onConfirm: () {
          updateScrambleConfig(configOrigin ?? config);
          configOrigin = null;
        },
        onCancel: () {
          configOrigin = null;
          updateScrambleConfig(config.copyWith(casesSelected: {}));
        },
      );
    } else {
      generateNewScramble();
    }
  }

  void updateScrambleConfig(SessionConfig config) {
    ConfigBucket().saveConfigToPersistence(config);
  }

  void onRefreshScramble() {
    scramble = _scrambler.generateScramble(
      casesSelected: config.casesSelected.toList(),
      randomizeAuf: config.randomizeAuf,
    );

    update();
  }
}
