import 'package:flutter/material.dart';

import '../../domain/settings_config.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    required this.config,
    required this.isRunning,
    required this.onConfigChanged,
    super.key,
  });

  final SettingsConfig config;
  final bool isRunning;

  final ValueChanged<SettingsConfig> onConfigChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 250,
      height: double.infinity,
      child: IgnorePointer(
        ignoring: isRunning,
        child: Card(
          child: Column(
            children: [
              Text(
                'Settings:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('2 Edges only'),
                value: config.twoEdgeCases,
                onChanged: (value) {
                  onConfigChanged(
                    config.copyWith(
                      twoEdgeCases: !config.twoEdgeCases,
                    ),
                  );
                },
              ),
              SwitchListTile(
                title: const Text('3 Edges cycles'),
                value: config.threeEdgeCases,
                onChanged: (value) {
                  onConfigChanged(
                    config.copyWith(
                      threeEdgeCases: !config.threeEdgeCases,
                    ),
                  );
                },
              ),
              SwitchListTile(
                title: const Text('2-2 Cycles'),
                value: config.twoTwoEdgeCases,
                onChanged: (value) {
                  onConfigChanged(
                    config.copyWith(
                      twoTwoEdgeCases: !config.twoTwoEdgeCases,
                    ),
                  );
                },
              ),
              SwitchListTile(
                title: const Text('4 Edge Cycles'),
                value: config.fourEdgeCases,
                onChanged: (value) {
                  onConfigChanged(
                    config.copyWith(
                      fourEdgeCases: !config.fourEdgeCases,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
