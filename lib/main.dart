import 'package:flutter/material.dart';
import 'package:fourtrainer/config/theme.dart';
import 'package:fourtrainer/sections/scramble_section.dart';
import 'package:fourtrainer/sections/statistics_section.dart';
import 'package:fourtrainer/services/storage_service.dart';
import 'package:get/get.dart';

import 'sections/settings_section.dart';
import 'sections/timer_section.dart';

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

    return MaterialApp(
      title: '4x4 Edge trainer',
      darkTheme: theme.themeData,
      themeMode: ThemeMode.dark,
      home: const AppPage(),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = context.isLargeTablet;
    const statisticsSection = StatisticsSection();
    const settingsSection = SettingsSection();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ScrambleSection(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLargeTablet) statisticsSection,
                const Expanded(
                  child: TimerSection(),
                ),
                if (isLargeTablet) settingsSection,
              ],
            ),
          ),
          if (!isLargeTablet) ...[
            statisticsSection,
            settingsSection,
          ],
        ],
      ),
    );
  }
}
