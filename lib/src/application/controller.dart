import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../cases.dart';
import '../domain/app_state.dart';
import '../domain/session_time.dart';
import '../domain/settings_config.dart';

class AppController {
  final random = Random();

  AppController() {
    storage.read(key: 'appState').then(
      (value) {
        if (value != null) {
          final appState = AppState.fromJsonMap(jsonDecode(value));
          if (appState != null) {
            state.value = appState;
          }
        }
      },
    );
  }

  ValueNotifier<AppState> state = ValueNotifier(
    kDebugMode ? AppState.fake() : const AppState(),
  );

  final storage = const FlutterSecureStorage();

  void updateState(AppState newState) {
    storage.write(key: 'appState', value: jsonEncode(newState.toJsonMap()));
    state.value = newState;
  }

  void onKeyEventHandler(KeyEvent value) {
    final state = this.state.value;

    if (value is! KeyUpEvent) {
      return;
    }
    switch (value.logicalKey) {
      case LogicalKeyboardKey.space:
        if (state.isTimerRunning) {
          final now = DateTime.now();
          final difference = now.difference(state.timerStartTime!);

          final time = SessionTime(
            duration: difference,
            when: now,
            scramble: state.scramble,
          );

          final scramble = generateScramble(state.config);

          updateState(
            state.copyWith(
              session: [
                ...state.session ?? [],
                time,
              ],
              timerStartTime: () => null,
              lastTime: time,
              scramble: scramble,
            ),
          );
        } else {
          final now = DateTime.now();
          updateState(
            state.copyWith(
              timerStartTime: () => now,
            ),
          );
        }
    }
  }

  void onDeleteSessionHandler() {
    updateState(
      state.value.copyWith(
        session: [],
      ),
    );
  }

  void onConfigChangedHandler(SettingsConfig value) {
    final scramble = generateScramble(value);

    updateState(
      state.value.copyWith(
        settingsConfig: value,
        scramble: scramble,
      ),
    );
  }

  String? generateScramble(SettingsConfig config) {
    final cases = [
      if (config.threeEdgeCases) ...Case.threeCycleCasesList,
      if (config.twoEdgeCases) ...Case.twoCasesList,
      if (config.twoTwoEdgeCases) ...Case.twoTwoCasesList,
      if (config.fourEdgeCases) ...Case.fourEdgeCycles,
    ];
    if (cases.isEmpty) return null;

    cases.shuffle(random);
    final randomCase = cases.elementAt(random.nextInt(cases.length));
    final randomCaseScrambles = randomCase.scrambles;
    randomCaseScrambles.shuffle(random);

    return randomCaseScrambles.first;
  }

  void onEditSessionTimeHandler((SessionTime, bool) value) {
    final item = state.value.session!.firstWhere((e) => e.when == value.$1.when);
    final timeIndex = state.value.session!.indexOf(item);
    final shouldDelete = value.$2;

    if (shouldDelete) {
      final newSession = List<SessionTime>.from(state.value.session!);
      newSession.removeAt(timeIndex);

      updateState(
        state.value.copyWith(
          session: newSession,
        ),
      );
    } else {
      final newSession = List<SessionTime>.from(state.value.session!);
      newSession[timeIndex] = value.$1;

      updateState(
        state.value.copyWith(
          session: newSession,
        ),
      );
    }
  }
}
