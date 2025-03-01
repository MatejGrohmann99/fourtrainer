import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/theme.dart';
import 'config/routing.dart';
import 'services/storage_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(
    StorageService(),
    permanent: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = ApplicationTheme();

    return GetMaterialApp(
      title: '4x4 Edge trainer',
      darkTheme: theme.themeData,
      themeMode: ThemeMode.dark,
      routes: getAppRoutes(),
    );
  }
}
