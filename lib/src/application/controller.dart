import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../cases.dart';
import '../domain/app_state.dart';
import '../domain/session.dart';
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

  final ValueNotifier<AppState> state = ValueNotifier(
    const AppState(
      selectedSessionIndex: 0,
      sessions: [
        Session(
          id: '1',
          name: 'Default',
          times: [],
          config: SettingsConfig(),
        ),
      ],
    ),
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
          final session = state.sessions[state.selectedSessionIndex];

          final time = SessionTime(
            duration: difference,
            when: now,
            scramble: state.scramble,
          );

          final scramble = generateScramble(session.config);
          final updatedSessionTimeList = List<SessionTime>.from(session.times)..add(time);
          final updatedSession = session.copyWith(times: updatedSessionTimeList);
          final updatedSessionList = List<Session>.from(state.sessions)..[state.selectedSessionIndex] = updatedSession;

          updateState(
            state.copyWith(
              sessions: updatedSessionList,
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

  void onDeleteSessionTimesHandler(int index) {
    final oldSessionsCopy = List<Session>.from(state.value.sessions);
    final newSession = oldSessionsCopy[state.value.selectedSessionIndex].copyWith(times: []);
    final newSessionsList = oldSessionsCopy..[state.value.selectedSessionIndex] = newSession;

    updateState(
      state.value.copyWith(
        sessions: newSessionsList,
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
    final session = state.value.sessions[state.value.selectedSessionIndex];

    final item = session.times.firstWhere((e) => e.when == value.$1.when);
    final timeIndex = session.times.indexOf(item);
    final shouldDelete = value.$2;

    if (shouldDelete) {
      final newSession = List<SessionTime>.from(session.times);
      newSession.removeAt(timeIndex);

      final oldSessionsCopy = List<Session>.from(state.value.sessions);
      final newSessionsList = oldSessionsCopy..[state.value.selectedSessionIndex] = session.copyWith(times: newSession);

      updateState(
        state.value.copyWith(
          sessions: newSessionsList,
        ),
      );
    } else {
      final newSession = List<SessionTime>.from(session.times);
      newSession[timeIndex] = value.$1;

      final oldSessionsCopy = List<Session>.from(state.value.sessions);
      final newSessionsList = oldSessionsCopy..[state.value.selectedSessionIndex] = session.copyWith(times: newSession);

      updateState(
        state.value.copyWith(
          sessions: newSessionsList,
        ),
      );
    }
  }

  void onSessionChangedRequestedHandler(int sessionIndex) {}
}
