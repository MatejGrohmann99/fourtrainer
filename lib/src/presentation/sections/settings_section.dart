import 'package:flutter/material.dart';
import 'package:fourtrainer/src/presentation/helpers/four_grid_painter.dart';

import '../../domain/case.dart';
import '../../domain/settings_config.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    required this.config,
    this.lastCase,
    super.key,
  });

  final SettingsConfig config;
  final Case? lastCase;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 250,
      height: double.infinity,
      child: Card(
        child: Column(
          children: [
            Text(
              'Statistics:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text('You have ${config.casesSelected.length} cases selected'),
            if (lastCase case final last?) ...[
              Text(last.displayName, style: Theme.of(context).textTheme.titleMedium),
              GridWidget(
                gridColors: last.ui,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
