import 'dart:convert';

import 'package:fourtrainer/domain/session_config.dart';
import 'package:fourtrainer/services/storage_service.dart';

class ConfigBucket {
  static final ConfigBucket _instance = ConfigBucket._();

  ConfigBucket._();

  factory ConfigBucket() => _instance;

  String configStorageKey = 'sessionConfigPersistence';

  SessionConfig getInitialConfig() => SessionConfig.initial();

  Future<SessionConfig?> getConfigFromPersistence() async {
    return await StorageService.to.read(configStorageKey).then(
      (value) {
        if (value != null) {
          final map = jsonDecode(value);
          if (map case final Map<String, dynamic>? map) {
            final configParsed = SessionConfig.fromJsonMap(map);
            if (configParsed != null) {
              return configParsed;
            }
          }
        }
        return null;
      },
    );
  }

  Future<void> saveConfigToPersistence(SessionConfig config) async {
    await StorageService.to.write(
      configStorageKey,
      jsonEncode(
        config.toJsonMap(),
      ),
    );
  }
}
