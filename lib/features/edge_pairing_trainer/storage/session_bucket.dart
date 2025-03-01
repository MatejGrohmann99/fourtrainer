import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fourtrainer/services/storage_service.dart';

import '../domain/session.dart';

class SessionBucket extends ChangeNotifier {
  static final SessionBucket _instance = SessionBucket._();

  SessionBucket._() {
    sync();
  }

  factory SessionBucket() => _instance;

  String sessionStorageKey(int index) => 'sessionBucketPersistence_$index';

  int index = 0;
  Session session = Session.initial();

  Future<Session?> getSessionFromPersistence() async {
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

  Future<void> saveSessionToPersistence(Session session) async {
    await StorageService.to.write(
      sessionStorageKey(index),
      jsonEncode(
        session.toJsonMap(),
      ),
    );
    sync();
  }

  Future<void> sync() async{
    await getSessionFromPersistence().then((value) {
      if (value != null) {
        session = value;
        notifyListeners();
      }
    });
  }
}
