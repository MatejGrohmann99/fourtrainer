import 'package:flutter/material.dart';
import 'package:fourtrainer/alg_sheet/alg_sheet_view.dart';
import 'package:fourtrainer/config/theme.dart';
import 'package:fourtrainer/sections/image_gen_view.dart';
import 'package:fourtrainer/sections/scramble_section.dart';
import 'package:fourtrainer/sections/statistics_section.dart';
import 'package:fourtrainer/services/storage_service.dart';
import 'package:fourtrainer/sheets/no_pll_alg_sheets.dart';
import 'package:fourtrainer/sheets/no_swap_u_parity.dart';
import 'package:fourtrainer/util/shortcuts_manager.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

    return GetMaterialApp(
      title: '4x4 Edge trainer',
      darkTheme: theme.themeData,
      themeMode: ThemeMode.dark,
      routes: {
        '/': (context) => const AppPage(),
        '/generate': (context) => const ImageGenPage(),
        '/panbezpll': (context) => AlgSheetView(
              sheets: getNoPllAlgSheets(),
            ),
      },
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

    return ShortcutsManager(
      child: Scaffold(
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
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              const url =
                  'https://docs.google.com/spreadsheets/d/1enMcY6R5P_RlL4XQcguQ74A5ATte3lHDnIJYr1wTf54/edit?usp=sharing';
              launchUrlString(url);
            },
            tooltip: 'Only source of truth',
            child: const Icon(Icons.book_outlined),
          )),
    );
  }
}
