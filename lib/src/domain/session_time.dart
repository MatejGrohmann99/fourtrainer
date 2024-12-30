class SessionTime {
  SessionTime({
    required this.duration,
    required this.when,
    this.message,
    this.scramble,
    this.hasDNF = false,
    this.hasPenalty = false,
  });

  final Duration duration;
  final DateTime when;
  final String? message;
  final String? scramble;

  final bool hasPenalty;
  final bool hasDNF;

  SessionTime copyWith({
    Duration? duration,
    DateTime? when,
    String? message,
    String? scramble,
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
        'scramble': scramble,
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

    return SessionTime(
      duration: Duration(milliseconds: sessionObject['duration'] as int),
      when: DateTime.parse(sessionObject['when'] as String),
      message: sessionObject['message'] as String?,
      scramble: sessionObject['scramble'] as String?,
      hasPenalty: sessionObject['hasPenalty'] as bool? ?? false,
      hasDNF: sessionObject['hasDNF'] as bool? ?? false,
    );
  }
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
