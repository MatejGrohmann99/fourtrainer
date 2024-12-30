import 'package:fourtrainer/src/domain/session.dart';
import 'package:fourtrainer/src/domain/session_time.dart';
import 'package:fourtrainer/src/domain/settings_config.dart';

class AppState {
  const AppState({
    required this.sessions,
    required this.selectedSessionIndex,
    this.timerStartTime,
    this.scramble,
    this.lastTime,
  });

  final int selectedSessionIndex;

  final List<Session> sessions;

  final DateTime? timerStartTime;

  bool get isTimerRunning => timerStartTime != null;

  final String? scramble;
  final SessionTime? lastTime;

  AppState copyWith({
    int? selectedSessionIndex,
    DateTime? Function()? timerStartTime,
    List<Session>? sessions,
    SettingsConfig? settingsConfig,
    String? scramble,
    SessionTime? lastTime,
  }) {
    return AppState(
      selectedSessionIndex: selectedSessionIndex ?? this.selectedSessionIndex,
      timerStartTime: timerStartTime != null ? timerStartTime() : this.timerStartTime,
      sessions: sessions ?? this.sessions,
      scramble: scramble ?? this.scramble,
      lastTime: lastTime ?? this.lastTime,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return {
      'appState': {
        'selectedSessionIndex': selectedSessionIndex,
        'sessions': sessions.map((e) => e.toJsonMap()).toList(),
        'scramble': scramble,
      },
    };
  }

  static AppState? fromJsonMap(Map<String, dynamic> jsonMap) {
    final appStateObject = jsonMap['appState'] as Map<String, dynamic>?;
    if (appStateObject == null) {
      return null;
    }

    final sessionOld = (appStateObject['session'] as List<dynamic>?)
            ?.map((e) => SessionTime.fromJsonMap(e as Map<String, dynamic>?))
            .toList()
            .nonNulls
            .toList() ??
        [];
    final configOld = SettingsConfig.fromJsonMap(appStateObject['settingsConfig'] as Map<String, dynamic>?);

    final sessions = (appStateObject['sessions'] as List<dynamic>?)
            ?.map((e) => Session.fromJsonMap(e as Map<String, dynamic>?))
            .toList()
            .nonNulls
            .toList() ??
        [
          Session(
            id: '1',
            name: 'Default',
            config: configOld ?? const SettingsConfig(),
            times: sessionOld,
          ),
        ];

    final index = appStateObject['selectedSessionIndex'] as int? ?? 0;

    return AppState(
      selectedSessionIndex: index,
      timerStartTime: appStateObject['timerStartTime'] == null
          ? null
          : DateTime.tryParse(appStateObject['timerStartTime'] as String? ?? ''),
      scramble: appStateObject['scramble'] as String?,
      lastTime: SessionTime.fromJsonMap(appStateObject['lastTime'] as Map<String, dynamic>?),
      sessions: sessions,
    );
  }
}
