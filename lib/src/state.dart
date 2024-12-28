import 'dart:math';

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
}

class SessionTime {
  SessionTime({
    required this.duration,
    required this.when,
    this.message,
    this.scramble,
  });

  final Duration duration;
  final DateTime when;
  final String? message;
  final String? scramble;

  @override
  String toString() {
    final seconds = duration.inSeconds;
    final secondsRemaining = seconds % 60;
    final secondsFormatted = secondsRemaining > 9 ? secondsRemaining : '0$secondsRemaining';
    final millisecondsRemaining = duration.inMilliseconds % 1000;
    final millisecondsFormatted = millisecondsRemaining > 99 ? millisecondsRemaining : '0$millisecondsRemaining';

    if (seconds < 60) {
      return '$secondsFormatted.$millisecondsFormatted';
    } else {
      return '${duration.inMinutes}:$secondsFormatted.$millisecondsFormatted';
    }
  }
}

class SettingsConfig {
  const SettingsConfig({
    this.twoEdgeCases = false,
    this.threeEdgeCases = false,
    this.twoTwoEdgeCases = false,
  });

  bool get any => twoEdgeCases || threeEdgeCases || twoTwoEdgeCases;

  final bool twoEdgeCases;
  final bool threeEdgeCases;
  final bool twoTwoEdgeCases;

  SettingsConfig copyWith({
    bool? twoEdgeCases,
    bool? threeEdgeCases,
    bool? twoTwoEdgeCases,
  }) {
    return SettingsConfig(
      twoEdgeCases: twoEdgeCases ?? this.twoEdgeCases,
      threeEdgeCases: threeEdgeCases ?? this.threeEdgeCases,
      twoTwoEdgeCases: twoTwoEdgeCases ?? this.twoTwoEdgeCases,
    );
  }
}
