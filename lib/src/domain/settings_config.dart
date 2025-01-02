import 'case.dart';

class SettingsConfig {
  const SettingsConfig({
    required this.casesSelected,
    required this.repeatEachCaseOnce,
    required this.randomizeAuf,
  });

  factory SettingsConfig.initial() {
    return const SettingsConfig(
      casesSelected: {},
      repeatEachCaseOnce: false,
      randomizeAuf: false,
    );
  }

  final Set<Case> casesSelected;
  final bool repeatEachCaseOnce;
  final bool randomizeAuf;

  bool isEmpty() {
    return casesSelected.isEmpty;
  }

  bool containsAll(List<Case> cases) {
    return casesSelected.containsAll(cases);
  }

  bool containsAtLeastOne(List<Case> cases) {
    return casesSelected.any((element) => cases.contains(element));
  }

  SettingsConfig addCases(List<Case> cases) {
    return copyWith(casesSelected: casesSelected.union(cases.toSet()));
  }

  SettingsConfig removeCases(List<Case> cases) {
    return copyWith(casesSelected: casesSelected.difference(cases.toSet()));
  }

  SettingsConfig copyWith({
    Set<Case>? casesSelected,
    bool? repeatEachCaseOnce,
    bool? randomizeAuf,
  }) {
    return SettingsConfig(
      repeatEachCaseOnce: repeatEachCaseOnce ?? this.repeatEachCaseOnce,
      casesSelected: casesSelected ?? this.casesSelected,
      randomizeAuf: randomizeAuf ?? this.randomizeAuf,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return {
      'settingsConfigCaseSelectable': {
        'repeatEachCaseOnce': repeatEachCaseOnce,
        'casesSelected': casesSelected.map((e) => e.toJsonString()).toList(),
        'randomizeAuf': randomizeAuf,
      }
    };
  }

  static SettingsConfig? fromJsonMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }
    final settingsConfigCaseSelectable = map['settingsConfigCaseSelectable'] as Map<String, dynamic>?;
    if (settingsConfigCaseSelectable == null) {
      return null;
    }

    final casesSelected = (settingsConfigCaseSelectable['casesSelected'] as List<dynamic>?)
            ?.map((e) => Case.fromJsonString(e as String?))
            .nonNulls
            .toSet() ??
        {};

    final repeatEachCaseOnce = settingsConfigCaseSelectable['repeatEachCaseOnce'] as bool?;

    final randomizeAuf = settingsConfigCaseSelectable['randomizeAuf'] as bool?;

    return SettingsConfig(
      casesSelected: casesSelected,
      repeatEachCaseOnce: repeatEachCaseOnce ?? false,
      randomizeAuf: randomizeAuf ?? false,
    );
  }
}
