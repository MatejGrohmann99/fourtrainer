import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cases.dart';
import 'state.dart';

class Controller {
  final random = Random();
  ValueNotifier<AppState> state = ValueNotifier(kDebugMode ? AppState.fake() : const AppState());

  void onKeyEventHandler(KeyEvent value) {
    if (value is! KeyUpEvent) {
      return;
    }
    switch (value.logicalKey) {
      case LogicalKeyboardKey.space:
        if (state.value.isTimerRunning) {
          final now = DateTime.now();
          final difference = now.difference(state.value.timerStartTime!);
          final time = SessionTime(
            duration: difference,
            when: now,
          );
          final scramble = generateScramble(state.value.config);
          state.value = state.value.copyWith(
            session: [
              ...state.value.session ?? [],
              time,
            ],
            timerStartTime: () => null,
            lastTime: time,
            scramble: scramble,
          );
        } else {
          final now = DateTime.now();
          state.value = state.value.copyWith(
            timerStartTime: () => now,
          );
        }
    }
  }

  void onDeleteSessionHandler() {
    state.value = state.value.copyWith(
      session: [],
    );
  }

  void onConfigChangedHandler(SettingsConfig value) {
    final scramble = generateScramble(value);

    state.value = state.value.copyWith(
      settingsConfig: value,
      scramble: scramble,
    );
  }

  generateScramble(SettingsConfig config) {
    final cases = [
      if (config.threeEdgeCases) ...Case.threeCycleCasesList,
      if (config.twoEdgeCases) ...Case.twoCasesList,
      if (config.twoTwoEdgeCases) ...Case.twoTwoCasesList,
    ];
    if (cases.isEmpty) return null;

    cases.shuffle(random);
    final randomCase = cases.elementAt(random.nextInt(cases.length));
    final randomCaseScrambles = randomCase.scrambles;
    randomCaseScrambles.shuffle(random);

    return randomCaseScrambles.first;
  }
}
