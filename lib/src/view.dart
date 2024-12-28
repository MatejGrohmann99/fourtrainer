import 'package:flutter/material.dart';
import 'package:fourtrainer/src/controller.dart';
import 'package:fourtrainer/src/state.dart';

class ContentView extends StatefulWidget {
  const ContentView({super.key});

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  final controller = Controller();
  final focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: focusNode,
      onKeyEvent: controller.onKeyEventHandler,
      child: ValueListenableBuilder(
        valueListenable: controller.state,
        builder: (context, state, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScrambleTileWidget(scramble: state.scramble),
              Expanded(
                child: Row(
                  children: [
                    SessionTabWidget(
                      session: state.session ?? [],
                      onDelete: controller.onDeleteSessionHandler,
                    ),
                    Expanded(
                      child: Center(
                        child: state.isTimerRunning
                            ? const CircularProgressIndicator()
                            : Column(
                          mainAxisSize: MainAxisSize.min,
                              children: [
                                if (state.lastTime case final lastTime?)
                                  Text('${lastTime.toString()}'),
                                const Text('Press SPACE to start timer'),
                              ],
                            ),
                      ),
                    ),
                    SettingsTab(
                      isRunning: state.isTimerRunning,
                      onConfigChanged: controller.onConfigChangedHandler,
                      config: state.config,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SessionTabWidget extends StatelessWidget {
  const SessionTabWidget({required this.session, required this.onDelete, super.key});

  final List<SessionTime> session;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final sessionReversed = session.reversed.toList();

    return Container(
      padding: const EdgeInsets.all(16),
      width: 250,
      height: double.infinity,
      child: Card(
        child: Column(
          children: [
            Text(
              'Session times:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    for (final time in sessionReversed)
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(time.toString()),
                      ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Text('Count: ${session.length}'),
            ElevatedButton.icon(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Yu sure Du?'),
                      content: SizedBox(
                        width: 250,
                        child: Image.asset('images/yu.png'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onDelete();
                          },
                          child: const Text('YES'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('NO'),
                        ),
                      ],
                    );
                  },
                );
              },
              label: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({
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
      padding: const EdgeInsets.all(16),
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
              Divider(),
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('3 edges cycles are not supported yet, je to v piči'),
                    ),
                  );
                  return;
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('2-2 edges cycles are not supported yet, je to v piči'),
                    ),
                  );
                  return;
                  onConfigChanged(
                    config.copyWith(
                      twoTwoEdgeCases: !config.twoTwoEdgeCases,
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

class ScrambleTileWidget extends StatelessWidget {
  const ScrambleTileWidget({this.scramble, super.key});

  final String? scramble;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 100,
      child: Card(
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              scramble ?? 'Select something to mašinka on',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
