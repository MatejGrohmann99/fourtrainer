import 'dart:math';

import 'package:fourtrainer/src/domain/session_time.dart';
import 'package:fourtrainer/src/domain/settings_config.dart';

class AppState {
  const AppState({
    this.message,
    this.timerStartTime,
    this.session,
    this.config = const SettingsConfig(),
    this.scramble,
    this.lastTime,
  });

  factory AppState.fake() {
    final Random random = Random();
    final session = List.generate(
      random.nextInt(600),
      (index) => Duration(
        seconds: random.nextInt(12),
        milliseconds: random.nextInt(1000),
      ),
    );

    return AppState(
        session: session.map(
      (e) {
        return SessionTime(
          duration: e,
          when: DateTime.now(),
        );
      },
    ).toList());
  }

  final String? message;

  final DateTime? timerStartTime;

  bool get isTimerRunning => timerStartTime != null;

  final List<SessionTime>? session;

  final SettingsConfig config;

  final String? scramble;

  final SessionTime? lastTime;

  AppState copyWith({
    String? message,
    DateTime? Function()? timerStartTime,
    List<SessionTime>? session,
    SettingsConfig? settingsConfig,
    String? scramble,
    SessionTime? lastTime,
  }) {
    return AppState(
      message: message ?? this.message,
      timerStartTime: timerStartTime != null ? timerStartTime() : this.timerStartTime,
      session: session ?? this.session,
      config: settingsConfig ?? config,
      scramble: scramble ?? this.scramble,
      lastTime: lastTime ?? this.lastTime,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return {
      'appState': {
        'message': message,
        'timerStartTime': timerStartTime?.toIso8601String(),
        'session': session?.map((e) => e.toJsonMap()).toList(),
        'settingsConfig': config.toJsonMap(),
        'scramble': scramble,
        'lastTime': lastTime?.toJsonMap(),
      },
    };
  }

  static AppState? fromJsonMap(Map<String, dynamic> jsonMap) {
    final appStateObject = jsonMap['appState'] as Map<String, dynamic>?;
    if (appStateObject == null) {
      return null;
    }

    return AppState(
      message: appStateObject['message'] as String?,
      timerStartTime: appStateObject['timerStartTime'] == null
          ? null
          : DateTime.tryParse(appStateObject['timerStartTime'] as String? ?? ''),
      session: (appStateObject['session'] as List<dynamic>?)
              ?.map((e) => SessionTime.fromJsonMap(e as Map<String, dynamic>?))
              .toList()
              .nonNulls
              .toList() ??
          [],
      config: SettingsConfig.fromJsonMap(appStateObject['settingsConfig'] as Map<String, dynamic>?)!,
      scramble: appStateObject['scramble'] as String?,
      lastTime: SessionTime.fromJsonMap(appStateObject['lastTime'] as Map<String, dynamic>?),
    );
  }
}
