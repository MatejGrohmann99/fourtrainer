import 'package:flutter/material.dart';
import 'package:fourtrainer/src/domain/case.dart';
import 'package:fourtrainer/src/domain/settings_config.dart';
import 'package:fourtrainer/src/presentation/helpers/four_grid_painter.dart';
import 'package:fourtrainer/src/presentation/helpers/mounted_set_state.dart';
import 'package:fourtrainer/src/presentation/helpers/overlay_handler.dart';
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
                              widget.scramble ?? 'Select something to 🚂 on',
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
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CaseTile(
                          cases: Case.threeCycleCasesList,
                          selectedCases: config.casesSelected.toList(),
                          name: '3-cycles',
                          onUpdate: (casesUpdate) {
                            setState(
                              () {
                                config = config.copyWith(
                                  casesSelected: casesUpdate.toSet(),
                                );
                              },
                            );
                          },
                        ),
                        CaseTile(
                          cases: Case.fourCycleCasesList,
                          selectedCases: config.casesSelected.toList(),
                          name: '4-cycles',
                          onUpdate: (casesUpdate) {
                            setState(
                              () {
                                config = config.copyWith(
                                  casesSelected: casesUpdate.toSet(),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
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

class CaseTile extends StatefulWidget {
  const CaseTile({
    required this.cases,
    required this.name,
    required this.onUpdate,
    required this.selectedCases,
    super.key,
  });

  final List<Case> cases;
  final List<Case> selectedCases;
  final String name;
  final ValueChanged<List<Case>> onUpdate;

  @override
  State<CaseTile> createState() => _CaseTileState();
}

class _CaseTileState extends State<CaseTile> {
  ScrollController scrollController = ScrollController();
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;

  double scrollOffset = 0;

  @override
  initState() {
    super.initState();
    scrollController.addListener(() {
      scrollOffset = scrollController.offset;
    });
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    OverlayHandler().showOverlay(
      context,
      Positioned(
        width: 170,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0.0, 200),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: ListView(
              controller: scrollController,
              children: List.generate(
                widget.cases.length,
                (index) => Builder(builder: (context) {
                  final isSelected = widget.selectedCases.contains(widget.cases[index]);
                  return SizedBox(
                    width: 170,
                    height: 150,
                    child: GestureDetector(
                      onTap: () {
                        final caseTapped = widget.cases[index];
                        if (isSelected) {
                          widget.onUpdate(List.from(widget.selectedCases)..remove(caseTapped));
                        } else {
                          widget.onUpdate(List.from(widget.selectedCases)..add(caseTapped));
                        }
                        _closeDropdown();
                        _openDropdown();
                      },
                      child: Card(
                        elevation: 16,
                        color: isSelected ? Colors.green : null,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColoredBox(
                            color: Theme.of(context).cardTheme.color!,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GridWidget(
                                  width: 70,
                                  height: 70,
                                  gridColors: widget.cases[index].ui,
                                ),
                                Text(
                                  widget.cases[index].displayName,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
      onInsert: () {
        mountedSetState(() {
          _isDropdownOpen = true;
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              if (scrollOffset > 50) {
                scrollController.jumpTo(scrollOffset);
              }
            },
          );
        });
      },
      onRemove: () {
        mountedSetState(() {
          _isDropdownOpen = false;
        });
      },
    );
  }

  void _closeDropdown() {
    OverlayHandler().hideOverlay();
  }

  @override
  Widget build(BuildContext context) {
    final numberOfSelectedCases = widget.selectedCases.where((element) => widget.cases.contains(element)).length;
    final selected = numberOfSelectedCases > 0;
    final isFullySelected = numberOfSelectedCases == widget.cases.length;

    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          width: 170,
          height: 170,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.zero,
            color: selected ? Colors.brown.shade900 : Colors.transparent,
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GridWidget(
                      width: 100,
                      height: 100,
                      gridColors: widget.cases.first.ui,
                    ),
                    Text(
                      widget.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '$numberOfSelectedCases/${widget.cases.length}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Checkbox(
                  value: isFullySelected,
                  onChanged: (_) {
                    if (isFullySelected) {
                      final cases = widget.selectedCases.where((element) => !widget.cases.contains(element)).toList();
                      widget.onUpdate(cases);
                    } else {
                      final cases = List<Case>.from(widget.selectedCases)..addAll(widget.cases);
                      widget.onUpdate(cases);
                    }
                    if (_isDropdownOpen) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          _closeDropdown();
                          _openDropdown();
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
