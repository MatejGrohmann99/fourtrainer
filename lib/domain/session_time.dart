import 'package:equatable/equatable.dart';
import 'package:revenge_cube/revenge_cube.dart';

class SessionTime extends Equatable {
  const SessionTime({
    required this.duration,
    required this.when,
    required this.scramble,
    this.message,
    this.hasDNF = false,
    this.hasPenalty = false,
  });

  final Duration duration;
  final DateTime when;
  final String? message;
  final RevengeScramble? scramble;

  final bool hasPenalty;
  final bool hasDNF;

  SessionTime copyWith({
    Duration? duration,
    DateTime? when,
    String? message,
    RevengeScramble? scramble,
    bool? hasPenalty,
    bool? hasDNF,
  }) {
    return SessionTime(
      duration: duration ?? this.duration,
      when: when ?? this.when,
      message: message ?? this.message,
      scramble: scramble ?? this.scramble,
      hasPenalty: hasPenalty ?? this.hasPenalty,
      hasDNF: hasDNF ?? this.hasDNF,
    );
  }

  @override
  String toString() {
    if (hasDNF) {
      return 'DNF';
    }
    return duration.prettyString(hasPenalty: hasPenalty);
  }

  Map<String, dynamic> toJsonMap() {
    return {
      'sessionTime': {
        'duration': duration.inMilliseconds,
        'when': when.toIso8601String(),
        'message': message,
        'scramble': scramble?.toJsonMap(),
        'hasPenalty': hasPenalty,
        'hasDNF': hasDNF,
      }
    };
  }

  static SessionTime? fromJsonMap(Map<String, dynamic>? jsonMap) {
    if (jsonMap == null) {
      return null;
    }
    final sessionObject = jsonMap['sessionTime'] as Map<String, dynamic>?;
    if (sessionObject == null) {
      return null;
    }

    final scramble = RevengeScramble.fromJsonMap(sessionObject['scramble'] as Map<String, dynamic>?);

    return SessionTime(
      duration: Duration(milliseconds: sessionObject['duration'] as int),
      when: DateTime.parse(sessionObject['when'] as String),
      message: sessionObject['message'] as String?,
      scramble: scramble,
      hasPenalty: sessionObject['hasPenalty'] as bool? ?? false,
      hasDNF: sessionObject['hasDNF'] as bool? ?? false,
    );
  }

  @override
  List<Object?> get props => [duration, when, message, scramble, hasPenalty, hasDNF];
}

extension Formatter on Duration {
  String prettyString({bool hasPenalty = false}) {
    final seconds = inSeconds + (hasPenalty ? 2 : 0);
    final secondsRemaining = seconds % 60;
    final secondsFormatted = secondsRemaining > 9 ? secondsRemaining : '0$secondsRemaining';
    final millisecondsRemaining = inMilliseconds % 1000;
    final millisecondsFormatted = millisecondsRemaining > 99 ? millisecondsRemaining : '0$millisecondsRemaining';

    if (seconds < 60) {
      return '$secondsFormatted.$millisecondsFormatted${hasPenalty ? '+' : ''}';
    } else {
      return '$inMinutes:$secondsFormatted.$millisecondsFormatted${hasPenalty ? '+' : ''}';
    }
  }
}
