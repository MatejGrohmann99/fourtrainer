import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();
  final storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    final value = await storage.read(key: key);
    _log('Read $key: $value');
    return value;
  }

  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
    _log('Write $key: $value');
  }

  _log(String message) {
    log(message, name: 'StorageService');
  }
}
