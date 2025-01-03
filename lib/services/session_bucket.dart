import 'dart:convert';

import 'package:fourtrainer/services/storage_service.dart';

import '../domain/session.dart';

class SessionBucket {
  static final SessionBucket _instance = SessionBucket._();

  SessionBucket._();

  factory SessionBucket() => _instance;

  String sessionStorageKey(int index) => 'sessionBucketPersistence_$index';

  Session getInitialSession() => Session.initial();

  Future<Session?> getSessionFromPersistence(int index) async {
    return await StorageService.to.read(sessionStorageKey(index)).then(
      (value) {
        if (value != null) {
          final map = jsonDecode(value);
          if (map case final Map<String, dynamic>? map) {
            final sessionParsed = Session.fromJsonMap(map);
            if (sessionParsed != null) {
              return sessionParsed;
            }
          }
        }
        return null;
      },
    );
  }

  Future<void> saveSessionToPersistence(Session session, int index) async {
    await StorageService.to.write(
      sessionStorageKey(index),
      jsonEncode(
        session.toJsonMap(),
      ),
    );
  }
}
