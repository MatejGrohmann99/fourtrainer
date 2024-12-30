import 'package:fourtrainer/src/domain/session_time.dart';
import 'package:fourtrainer/src/domain/settings_config.dart';

class Session {
  const Session({
    required this.id,
    required this.name,
    required this.config,
    required this.times,
  });

  final String id;
  final String name;
  final SettingsConfig config;
  final List<SessionTime> times;

  String get mean {
    if (times.isEmpty) {
      return '0:00';
    }

    final sum = times.fold<Duration>(Duration.zero, (previousValue, element) => previousValue + element.duration);
    final average = Duration(milliseconds: sum.inMilliseconds ~/ times.length);
    return average.prettyString();
  }

  Session copyWith({
    String? id,
    String? name,
    SettingsConfig? config,
    List<SessionTime>? times,
  }) {
    return Session(
      id: id ?? this.id,
      name: name ?? this.name,
      config: config ?? this.config,
      times: times ?? this.times,
    );
  }

  static Session? fromJsonMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    final sessionObject = map['sessionObject'] as Map<String, dynamic>?;
    if (sessionObject == null) {
      return null;
    }

    final config = SettingsConfig.fromJsonMap(sessionObject['config'] as Map<String, dynamic>?);
    if (config == null) {
      return null;
    }

    final times = (sessionObject['times'] as List<dynamic>?)
            ?.map((e) => SessionTime.fromJsonMap(e as Map<String, dynamic>?))
            .nonNulls
            .toList() ??
        [];

    return Session(
      id: sessionObject['id'] as String,
      name: sessionObject['name'] as String,
      config: config,
      times: times,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return {
      'sessionObject': {
        'id': id,
        'name': name,
        'config': config.toJsonMap(),
        'times': times.map((e) => e.toJsonMap()).toList(),
      },
    };
  }
}
