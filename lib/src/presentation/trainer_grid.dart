import 'package:flutter/material.dart';
import 'package:fourtrainer/src/presentation/sections/scramble_section.dart';
import 'package:fourtrainer/src/presentation/sections/settings_section.dart';
import 'package:fourtrainer/src/presentation/sections/statistics_section.dart';
import 'package:fourtrainer/src/presentation/sections/timer_section.dart';

import '../controller.dart';

class TrainerGrid extends StatefulWidget {
  const TrainerGrid({
    super.key,
  });

  @override
  State<TrainerGrid> createState() => _TrainerGridState();
}

class _TrainerGridState extends State<TrainerGrid> {
  final controller = Controller();
  final focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: focusNode,
      onKeyEvent: controller.onKeyEventHandler,
      child: ValueListenableBuilder(
        valueListenable: controller.state,
        builder: (context, state, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScrambleSection(scramble: state.scramble),
              Expanded(
                child: Row(
                  children: [
                    StatisticsSection(
                      session: state.session ?? [],
                      onDelete: controller.onDeleteSessionHandler,
                    ),
                    Expanded(
                      child: TimerSection(
                        isTimerRunning: state.isTimerRunning,
                        lastTime: state.lastTime,
                      ),
                    ),
                    SettingsSection(
                      isRunning: state.isTimerRunning,
                      onConfigChanged: controller.onConfigChangedHandler,
                      config: state.config,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
