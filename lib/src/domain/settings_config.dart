class SettingsConfig {
  const SettingsConfig({
    this.twoEdgeCases = false,
    this.threeEdgeCases = false,
    this.twoTwoEdgeCases = false,
    this.fourEdgeCases = false,
  });

  bool get any => twoEdgeCases || threeEdgeCases || twoTwoEdgeCases;

  final bool twoEdgeCases;
  final bool threeEdgeCases;
  final bool twoTwoEdgeCases;
  final bool fourEdgeCases;

  SettingsConfig copyWith({
    bool? twoEdgeCases,
    bool? threeEdgeCases,
    bool? twoTwoEdgeCases,
    bool? fourEdgeCases,
  }) {
    return SettingsConfig(
      twoEdgeCases: twoEdgeCases ?? this.twoEdgeCases,
      threeEdgeCases: threeEdgeCases ?? this.threeEdgeCases,
      twoTwoEdgeCases: twoTwoEdgeCases ?? this.twoTwoEdgeCases,
      fourEdgeCases: fourEdgeCases ?? this.fourEdgeCases,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return {
      'settingsConfig': {
        'twoEdgeCases': twoEdgeCases,
        'threeEdgeCases': threeEdgeCases,
        'twoTwoEdgeCases': twoTwoEdgeCases,
        'fourEdgeCases': fourEdgeCases,
      }
    };
  }

  static SettingsConfig? fromJsonMap(Map<String, dynamic>? jsonMap) {
    if (jsonMap == null) {
      return null;
    }
    final settingsObject = jsonMap['settingsConfig'] as Map<String, dynamic>?;
    if (settingsObject == null) {
      return null;
    }

    return SettingsConfig(
      twoEdgeCases: settingsObject['twoEdgeCases'] as bool? ?? false,
      threeEdgeCases: settingsObject['threeEdgeCases'] as bool? ?? false,
      twoTwoEdgeCases: settingsObject['twoTwoEdgeCases'] as bool? ?? false,
      fourEdgeCases: settingsObject['fourEdgeCases'] as bool? ?? false,
    );
  }
}
