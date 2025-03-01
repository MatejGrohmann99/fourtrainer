import 'package:equatable/equatable.dart';
import 'package:revenge_cube/revenge_cube.dart';

class SessionConfig extends Equatable {
  const SessionConfig({
    required this.casesSelected,
    required this.repeatEachCaseOnce,
    required this.randomizeAuf,
  });

  factory SessionConfig.initial() {
    return const SessionConfig(
      casesSelected: {},
      repeatEachCaseOnce: false,
      randomizeAuf: false,
    );
  }

  final Set<RevengeCase> casesSelected;
  final bool repeatEachCaseOnce;
  final bool randomizeAuf;

  bool isEmpty() {
    return casesSelected.isEmpty;
  }

  bool containsAll(List<RevengeCase> cases) {
    return casesSelected.containsAll(cases);
  }

  bool containsAtLeastOne(List<RevengeCase> cases) {
    return casesSelected.any((element) => cases.contains(element));
  }

  SessionConfig addCases(List<RevengeCase> cases) {
    return copyWith(casesSelected: casesSelected.union(cases.toSet()));
  }

  SessionConfig removeCases(List<RevengeCase> cases) {
    return copyWith(casesSelected: casesSelected.difference(cases.toSet()));
  }

  SessionConfig copyWith({
    Set<RevengeCase>? casesSelected,
    bool? repeatEachCaseOnce,
    bool? randomizeAuf,
  }) {
    return SessionConfig(
      repeatEachCaseOnce: repeatEachCaseOnce ?? this.repeatEachCaseOnce,
      casesSelected: casesSelected ?? this.casesSelected,
      randomizeAuf: randomizeAuf ?? this.randomizeAuf,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return {
      'settingsConfigCaseSelectable': {
        'repeatEachCaseOnce': repeatEachCaseOnce,
        'casesSelected': casesSelected.map((e) => e.json).toList(),
        'randomizeAuf': randomizeAuf,
      }
    };
  }

  static SessionConfig? fromJsonMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }
    final settingsConfigCaseSelectable = map['settingsConfigCaseSelectable'] as Map<String, dynamic>?;
    if (settingsConfigCaseSelectable == null) {
      return null;
    }

    final casesSelected = (settingsConfigCaseSelectable['casesSelected'] as List<dynamic>?)
            ?.map((e) => RevengeCase.fromJson(e as String?))
            .nonNulls
            .toSet() ??
        {};

    final repeatEachCaseOnce = settingsConfigCaseSelectable['repeatEachCaseOnce'] as bool?;

    final randomizeAuf = settingsConfigCaseSelectable['randomizeAuf'] as bool?;

    return SessionConfig(
      casesSelected: casesSelected,
      repeatEachCaseOnce: repeatEachCaseOnce ?? false,
      randomizeAuf: randomizeAuf ?? false,
    );
  }

  @override
  List<Object?> get props => [casesSelected, repeatEachCaseOnce, randomizeAuf];
}
