import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/sections/scramble_section.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/sections/settings_section.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/storage/session_bucket.dart';
import 'package:fourtrainer/util/snackbar.dart';
import 'package:get/get.dart';

import '../domain/session_time.dart';

class TimerSection extends StatelessWidget {
  const TimerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerController>(
      init: TimerController(),
      builder: (controller) {
        final isProbablyMobile = MediaQuery.of(context).size.width < 600;

        return Column(
          children: [
            Expanded(
              child: KeyboardListener(
                focusNode: controller.focusNode,
                onKeyEvent: (event) {
                  controller.onKeyEventHandler(event, context);
                },
                child: Builder(
                  builder: (context) {
                    final displayText = controller.timer?.isActive ?? false
                        ? controller.count.toStringAsFixed(2)
                        : controller.lastTime.toString();
                    final turtleProgress =
                        (controller.count < 5 ? 0 : (sin(controller.count) * 20 + 20).round()).toInt();
                    final turtleStart = List.filled(40 - turtleProgress, ' ').join();
                    final turtleEnd = List.filled(turtleProgress, ' ').join();
                    final secondaryWidget = controller.timer?.isActive ?? false
                        ? controller.count > 5
                            ? Text(
                                '$turtleStart🐢$turtleEnd',
                                style: Theme.of(context).textTheme.displayLarge,
                              )
                            : null
                        : Text(
                            'Press SPACE to start',
                            style: Theme.of(context).textTheme.labelLarge,
                          );

                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            displayText,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          SizedBox(
                            height: 150,
                            child: secondaryWidget ?? const SizedBox.expand(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            if (isProbablyMobile)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: 300,
                    child: OutlinedButton(
                      onPressed: () {
                        controller.onKeyEventHandler(
                            const KeyUpEvent(
                              logicalKey: LogicalKeyboardKey.space,
                              physicalKey: PhysicalKeyboardKey.space,
                              timeStamp: Duration(seconds: 2),
                            ),
                            context);
                      },
                      child: Text(controller.isTimerRunning ? 'Stop' : 'Start'),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class TimerController extends GetxController {
  static TimerController get to => Get.find();

  final FocusNode focusNode = FocusNode();

  DateTime? timerStartTime;

  bool get isTimerRunning => timerStartTime != null;

  double count = 0;

  Duration lastTime = Duration.zero;

  requestFocus() {
    if (!focusNode.hasFocus && focusNode.canRequestFocus) {
      focusNode.requestFocus();
    }
  }

  Timer? timer;

  @override
  void onReady() {
    focusNode.requestFocus();
    super.onReady();
  }

  @override
  void onClose() {
    focusNode.dispose();
    timer?.cancel();
    super.onClose();
  }

  void onKeyEventHandler(KeyEvent value, BuildContext context) {
    if (value is! KeyUpEvent) {
      return;
    }

    switch (value.logicalKey) {
      case LogicalKeyboardKey.space:
        final isInConfiguration = !ScrambleController.to.isScrambleVisible;
        if (isInConfiguration) {
          return SnackBarHandler().karaMessage(context, 'Please close the configuration first');
        }
        final hasValidScramble = ScrambleController.to.scramble != null;
        if (!hasValidScramble) {
          return SnackBarHandler().karaMessage(context, 'Please select some cases first');
        }

        if (isTimerRunning) {
          timer?.cancel();
          count = 0;
          final now = DateTime.now();
          lastTime = now.difference(timerStartTime!);
          timerStartTime = null;

          final scramble = ScrambleController.to.scramble!;
          final sessionTime = SessionTime(
            scramble: scramble,
            duration: lastTime,
            when: now,
          );

          ScrambleController.to.onAddTime(context, sessionTime);
          SettingsController.to.onAddTime(sessionTime);
          SessionBucket().saveSessionToPersistence(SessionBucket().session.addTime(sessionTime));

          update();
        } else {
          timerStartTime = DateTime.now();
          timer = Timer.periodic(
            const Duration(milliseconds: 10),
            (timer) {
              count += 0.01;
              update();
            },
          );
        }
    }
  }
}
