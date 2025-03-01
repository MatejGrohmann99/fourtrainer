

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../util/shortcuts_manager.dart';
import 'sections/scramble_section.dart';
import 'sections/settings_section.dart';
import 'sections/statistics_section.dart';
import 'sections/timer_section.dart';

class EdgePairingTrainerPage extends StatelessWidget {
  const EdgePairingTrainerPage({super.key});

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
