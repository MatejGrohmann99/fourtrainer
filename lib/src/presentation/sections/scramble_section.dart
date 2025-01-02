import 'package:flutter/material.dart';
import 'package:fourtrainer/src/domain/case.dart';
import 'package:fourtrainer/src/domain/settings_config.dart';
import 'package:fourtrainer/src/presentation/helpers/four_grid_painter.dart';
import 'package:fourtrainer/src/presentation/helpers/yu_sure_du.dart';

class ScrambleSection extends StatefulWidget {
  const ScrambleSection({
    this.scramble,
    required this.config,
    required this.configUpdateHandler,
    super.key,
  });

  final String? scramble;
  final SettingsConfig config;
  final void Function(SettingsConfig) configUpdateHandler;

  @override
  State<ScrambleSection> createState() => _ScrambleSectionState();
}

class _ScrambleSectionState extends State<ScrambleSection> {
  late bool isConfiguring = widget.scramble != null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: isConfiguring
          ? ConfigView(
              config: widget.config,
              onCancel: () {
                setState(
                  () {
                    isConfiguring = false;
                  },
                );
              },
              onConfigUpdate: (config) {
                setState(
                  () {
                    isConfiguring = false;
                  },
                );
                widget.configUpdateHandler(config);
              },
            )
          : Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              height: 100,
              child: Card(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    BackButton(
                      onPressed: () {
                        setState(
                          () {
                            isConfiguring = true;
                          },
                        );
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.scramble ?? 'Select something to mašinka on',
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class ConfigView extends StatefulWidget {
  const ConfigView({
    required this.config,
    required this.onCancel,
    required this.onConfigUpdate,
    super.key,
  });

  final SettingsConfig config;
  final VoidCallback onCancel;
  final ValueChanged onConfigUpdate;

  @override
  State<ConfigView> createState() => _ConfigViewState();
}

class _ConfigViewState extends State<ConfigView> {
  late SettingsConfig configOriginal = widget.config;
  late SettingsConfig config = widget.config;

  bool get isChanged =>
      config.casesSelected != configOriginal.casesSelected ||
      config.repeatEachCaseOnce != configOriginal.repeatEachCaseOnce ||
      config.randomizeAuf != configOriginal.randomizeAuf;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 300,
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  CloseButton(
                    onPressed: () {
                      if (isChanged) {
                        yuSureDu(context, message: 'Your changes will be lost').then(
                          (value) {
                            if (value) widget.onCancel();
                          },
                        );
                      } else {
                        widget.onCancel();
                      }
                    },
                  ),
                  const Spacer(),
                  CaseTile(
                    caseUsed: Case.threeCycleCasesList.first,
                    name: '3-cycles',
                    onTap: () {
                      setState(
                        () {
                          if (config.containsAtLeastOne(Case.threeCycleCasesList)) {
                            config = config.removeCases(Case.threeCycleCasesList);
                          } else {
                            config = config.addCases(Case.threeCycleCasesList);
                          }
                        },
                      );
                    },
                    selected: config.containsAtLeastOne(Case.threeCycleCasesList),
                  ),
                  CaseTile(
                    caseUsed: Case.fourCycleCasesList.first,
                    name: '4-cycles',
                    onTap: () {
                      setState(
                        () {
                          if (config.containsAtLeastOne(Case.fourCycleCasesList)) {
                            config = config.removeCases(Case.fourCycleCasesList);
                          } else {
                            config = config.addCases(Case.fourCycleCasesList);
                          }
                        },
                      );
                    },
                    selected: config.containsAtLeastOne(Case.fourCycleCasesList),
                  ),
                  const Spacer(),
                  if (isChanged)
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(Icons.save),
                      onPressed: () {
                        widget.onConfigUpdate(config);
                      },
                    ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Repeat case only once'),
              leading: Checkbox(
                value: config.repeatEachCaseOnce,
                onChanged: (_) {
                  setState(
                    () {
                      config = config.copyWith(repeatEachCaseOnce: !config.repeatEachCaseOnce);
                    },
                  );
                },
              ),
              onTap: () {
                setState(
                  () {
                    config = config.copyWith(repeatEachCaseOnce: !config.repeatEachCaseOnce);
                  },
                );
              },
            ),
            ListTile(
              title: const Text('Randomize auf'),
              leading: Checkbox(
                value: config.randomizeAuf,
                onChanged: (_) {
                  setState(
                    () {
                      config = config.copyWith(randomizeAuf: !config.randomizeAuf);
                    },
                  );
                },
              ),
              onTap: () {
                setState(
                  () {
                    config = config.copyWith(randomizeAuf: !config.randomizeAuf);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CaseTile extends StatelessWidget {
  const CaseTile({
    required this.caseUsed,
    required this.selected,
    required this.name,
    required this.onTap,
    super.key,
  });

  final bool selected;
  final Case caseUsed;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.zero,
          color: selected ? Colors.brown.shade900 : Colors.transparent,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GridWidget(
                width: 100,
                height: 100,
                gridColors: caseUsed.ui,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
