import 'package:equatable/equatable.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/domain/session_config.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/domain/session_time.dart';

class Session extends Equatable {
  const Session({
    required this.name,
    required this.times,
  });

  factory Session.initial() {
    return const Session(
      name: 'Session',
      times: [],
    );
  }

  final String name;
  final List<SessionTime> times;

  Session addTime(SessionTime time) {
    final newSessionList = List<SessionTime>.from(times)..add(time);
    return copyWith(times: newSessionList);
  }

  Session removeTime(SessionTime time) {
    final timeIndex = times.indexOf(time);
    if (timeIndex case final timeIndex when timeIndex != -1) {
      final newSessionList = List<SessionTime>.from(times)..removeAt(timeIndex);
      return copyWith(times: newSessionList);
    }
    return this;
  }

  Session removeTimeAt(int index) {
    final newSessionList = List<SessionTime>.from(times)..removeAt(index);
    return copyWith(times: newSessionList);
  }

  Session updateTimeAt(int index, SessionTime time) {
    final newSessionList = List<SessionTime>.from(times)..[index] = time;
    return copyWith(times: newSessionList);
  }

  String get mean {
    if (times.isEmpty) {
      return '0:00';
    }

    final sum = times.fold<Duration>(Duration.zero, (previousValue, element) => previousValue + element.duration);
    final average = Duration(milliseconds: sum.inMilliseconds ~/ times.length);
    return average.prettyString();
  }

  Session copyWith({
    String? name,
    SessionConfig? config,
    List<SessionTime>? times,
  }) {
    return Session(
      name: name ?? this.name,
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

    final times = (sessionObject['times'] as List<dynamic>?)
            ?.map((e) => SessionTime.fromJsonMap(e as Map<String, dynamic>?))
            .nonNulls
            .toList() ??
        [];

    return Session(
      name: sessionObject['name'] as String,
      times: times,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return {
      'sessionObject': {
        'name': name,
        'times': times.map((e) => e.toJsonMap()).toList(),
      },
    };
  }

  @override
  List<Object?> get props => [name, times];
}
