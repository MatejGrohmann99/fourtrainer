import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/sections/statistics_section.dart';
import 'package:get/get.dart';

import 'dialog.dart';

class ShortcutsManager extends StatelessWidget {
  const ShortcutsManager({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShortcutsManagerController>(
      init: ShortcutsManagerController(),
      builder: (controller) {
        return Builder(builder: (context) {
          return Shortcuts(
            shortcuts: () {
              return controller.shortcuts(context);
            }(),
            child: child,
          );
        });
      },
    );
  }
}

class ShortcutsManagerController extends GetxController {
  static ShortcutsManagerController get to => Get.find();

  Map<ShortcutActivator, Intent> shortcuts(BuildContext context) => {
        LogicalKeySet(
          LogicalKeyboardKey.alt,
          LogicalKeyboardKey.keyD,
        ): VoidCallbackIntent(() => _onDeleteSessionRequest(context)),
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.digit1,
        ): VoidCallbackIntent(() => _onResetToggled(context)),
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.digit2,
        ): VoidCallbackIntent(() => _onPlusTwoToggled(context)),
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.digit3,
        ): VoidCallbackIntent(() => _onDNFToggled(context)),
      };

  void _onDeleteSessionRequest(BuildContext context) {
    if (DialogHandler().isDialogOpened) return;
    StatisticsController.to.onClearSessionPressed(context);
  }

  void _onResetToggled(BuildContext context) {
    if (StatisticsController.to.session.times.isEmpty) return;
    final lastSessionTimeIndex = StatisticsController.to.session.times.length - 1;
    StatisticsController.to.updateTime(
      (time) => time.copyWith(
        hasDNF: false,
        hasPenalty: false,
      ),
      lastSessionTimeIndex,
    );
  }

  void _onPlusTwoToggled(BuildContext context) {
    if (StatisticsController.to.session.times.isEmpty) return;
    final lastSessionTimeIndex = StatisticsController.to.session.times.length - 1;
    StatisticsController.to.updateTime(
      (time) => time.copyWith(
        hasDNF: false,
        hasPenalty: true,
      ),
      lastSessionTimeIndex,
    );
  }

  void _onDNFToggled(BuildContext context) {
    if (StatisticsController.to.session.times.isEmpty) return;

    final lastSessionTimeIndex = StatisticsController.to.session.times.length - 1;
    StatisticsController.to.updateTime(
      (time) => time.copyWith(
        hasDNF: true,
        hasPenalty: false,
      ),
      lastSessionTimeIndex,
    );
  }
}
