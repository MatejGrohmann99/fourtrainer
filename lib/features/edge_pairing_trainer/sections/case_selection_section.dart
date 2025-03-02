import 'package:flutter/material.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/domain/session_config.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/sections/scramble_section.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/storage/config_bucket.dart';
import 'package:fourtrainer/util/overlay.dart';
import 'package:get/get.dart';
import 'package:revenge_cube/revenge_cube.dart';

import '../../../util/dialog.dart';

class CaseSelection extends StatelessWidget {
  const CaseSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CaseController>(
      init: CaseController(),
      builder: (controller) {
        final isTablet = context.isSmallTablet;
        return Container(
          padding: isTablet ? const EdgeInsets.all(24) : const EdgeInsets.all(8),
          width: double.infinity,
          height: isTablet ? 520 : 420,
          child: Card(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      CloseButton(
                        onPressed: () {
                          controller.onExit(context);
                        },
                      ),
                      const Spacer(),
                      Text(
                        'Case selection',
                        style:
                            isTablet ? Theme.of(context).textTheme.titleLarge : Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      if (controller.isChanged) ...[
                        IconButton(
                          iconSize: 24,
                          icon: const Icon(Icons.save),
                          onPressed: () {
                            controller.onSave();
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CaseTile(
                              index: 0,
                              link: controller.twoCyclesLayerLink,
                              cases: RevengeCase.twoCycleCases,
                            ),
                            CaseTile(
                              index: 1,
                              link: controller.threeCyclesLayerLink,
                              cases: RevengeCase.topLayer3cycles,
                            ),
                            CaseTile(
                              index: 2,
                              link: controller.topLayerThreeCyclesLayerLink,
                              cases: RevengeCase.frSlot3cycles,
                            ),
                            CaseTile(
                              index: 3,
                              link: controller.twoTwoCyclesLayerLink,
                              cases: RevengeCase.twoTwoCycleCases,
                            ),
                            CaseTile(
                              index: 4,
                              link: controller.fourCyclesLayerLink,
                              cases: RevengeCase.topLayer4cycles,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Repeat case only once'),
                  leading: Checkbox(
                    value: controller.repeatEachCaseOnce,
                    onChanged: (_) {
                      controller.toggleRepeatEachCaseOnce();
                    },
                  ),
                  onTap: () {
                    controller.toggleRepeatEachCaseOnce();
                  },
                ),
                ListTile(
                  title: const Text('Randomize auf'),
                  leading: Checkbox(
                    value: controller.randomizeAuf,
                    onChanged: (_) {
                      controller.toggleRandomizeAuf();
                    },
                  ),
                  onTap: () {
                    controller.toggleRandomizeAuf();
                  },
                ),
                ListTile(
                  title: const Text('Show five move trigger as 💣'),
                  leading: Checkbox(
                    value: controller.shouldShowFiveMoveTriggerAsBomb,
                    onChanged: (_) {
                      controller.showFiveMoveTriggerAsBomb();
                    },
                  ),
                  onTap: () {
                    controller.showFiveMoveTriggerAsBomb();
                  },
                ),
                ListTile(
                  trailing: Text(
                    'Selected cases: ${controller.config.casesSelected.length}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CaseTile extends StatelessWidget {
  const CaseTile({required this.index, required this.link, required this.cases, super.key});

  final LayerLink link;
  final int index;
  final List<RevengeCase> cases;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CaseController>(
      builder: (controller) {
        final isTablet = context.isSmallTablet;
        final int casesSelectedCount = controller.getNumberOfSelectedCases(cases);
        return GestureDetector(
          onTap: () {
            controller.toggleDropdown(
              context,
              cases,
              link,
              index,
            );
          },
          child: CompositedTransformTarget(
            link: link,
            child: Container(
              width: isTablet ? 170 : 120,
              height: isTablet ? 170 : 120,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.zero,
                color: casesSelectedCount > 0 ? Colors.brown.shade900 : Colors.transparent,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RevengeCubeWidget(
                          width: isTablet ? 100 : 50,
                          height: isTablet ? 100 : 50,
                          colors: cases.first.ui,
                        ),
                        Text(
                          cases.first.categoryName,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '$casesSelectedCount/${cases.length}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Checkbox(
                      value: casesSelectedCount == cases.length,
                      onChanged: (_) {
                        controller.toggleTileCheckbox(cases);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CasesOverlayWidget extends StatelessWidget {
  const CasesOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CaseController>(
      builder: (controller) {
        final isTablet = context.isSmallTablet;
        return Positioned(
          width: isTablet ? 170 : 120,
          child: CompositedTransformFollower(
            link: controller.dropdownLayerLink!,
            showWhenUnlinked: false,
            offset: Offset(0.0, isTablet ? 200 : 150),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: ListView(
                children: List.generate(
                  controller.dropdownCases.length,
                  (index) => Builder(builder: (context) {
                    final caseUsed = controller.dropdownCases[index];
                    final isSelected = controller.isCaseSelected(caseUsed);
                    return SizedBox(
                      width: isTablet ? 170 : 120,
                      height: isTablet ? 150 : 100,
                      child: GestureDetector(
                        onTap: () {
                          if (isSelected) {
                            controller.removeCase(caseUsed);
                          } else {
                            controller.addCase(caseUsed);
                          }
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
                                  RevengeCubeWidget(
                                    width: isTablet ? 70 : 30,
                                    height: isTablet ? 70 : 30,
                                    colors: caseUsed.ui,
                                  ),
                                  Text(
                                    caseUsed.caseName,
                                    textAlign: TextAlign.center,
                                    style: isTablet
                                        ? Theme.of(context).textTheme.labelMedium
                                        : Theme.of(context).textTheme.labelSmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
        );
      },
    );
  }
}

class CaseController extends GetxController {
  static CaseController get to => Get.find();

  @override
  onReady() {
    ConfigBucket().addListener(configListener);
  }

  @override
  onClose() {
    ConfigBucket().removeListener(configListener);
  }

  configListener() {
    final configFromStorage = ConfigBucket().config;
    config = configFromStorage;
    originalConfig = configFromStorage;
  }

  LayerLink twoCyclesLayerLink = LayerLink();
  LayerLink twoTwoCyclesLayerLink = LayerLink();
  LayerLink threeCyclesLayerLink = LayerLink();
  LayerLink topLayerThreeCyclesLayerLink = LayerLink();
  LayerLink fourCyclesLayerLink = LayerLink();

  LayerLink? dropdownLayerLink;
  List<RevengeCase> dropdownCases = [];
  int dropdownIndex = -1;

  bool get isDropdownOpen => dropdownCases.isNotEmpty;

  SessionConfig originalConfig = ConfigBucket().config;
  SessionConfig config = ConfigBucket().config;

  bool get randomizeAuf => config.randomizeAuf;

  bool get repeatEachCaseOnce => config.repeatEachCaseOnce;

  bool get shouldShowFiveMoveTriggerAsBomb => config.showFiveMoveTriggerAsBomb;

  int getNumberOfSelectedCases(List<RevengeCase> cases) =>
      cases.where((element) => config.casesSelected.contains(element)).length;

  bool isCaseSelected(RevengeCase caseTest) => config.casesSelected.contains(caseTest);

  bool get isChanged => config != originalConfig;

  void toggleRandomizeAuf() {
    config = config.copyWith(randomizeAuf: !config.randomizeAuf);
    update();
  }

  void toggleRepeatEachCaseOnce() {
    config = config.copyWith(repeatEachCaseOnce: !config.repeatEachCaseOnce);
    update();
  }


  void showFiveMoveTriggerAsBomb() {
    config = config.copyWith(showFiveMoveTriggerAsBomb: !config.showFiveMoveTriggerAsBomb);
    update();
  }

  void updateConfig(SessionConfig newConfig) {
    config = newConfig;
    originalConfig = newConfig;
    update();
  }

  void onSave() {
    originalConfig = config;
    ConfigBucket().saveConfigToPersistence(config);
  }

  void onExit(BuildContext context) {
    if (!isChanged) {
      config = originalConfig;
      ScrambleController.to.toggleScrambleVisibility();
      return;
    }

    DialogHandler().yuSureDu(context, message: 'All you changes will be lost').then(
      (val) {
        if (val) {
          config = originalConfig;
          ScrambleController.to.toggleScrambleVisibility();
        }
      },
    );
  }

  void toggleTileCheckbox(List<RevengeCase> cases) {
    final wasItSelected = cases.every((element) => config.casesSelected.contains(element));
    if (wasItSelected) {
      config = config.removeCases(cases);
    } else {
      config = config.addCases(cases);
    }
    update();
  }

  void toggleDropdown(
    BuildContext context,
    List<RevengeCase> cases,
    LayerLink link,
    int index,
  ) {
    if (dropdownIndex == index) {
      OverlayHandler().hideOverlay();
      dropdownLayerLink = null;
      dropdownCases = [];
      dropdownIndex = -1;
      update();
      return;
    } else {
      dropdownCases = cases;
      dropdownLayerLink = link;
      dropdownIndex = index;
      OverlayHandler().showOverlay(
        context,
        const CasesOverlayWidget(),
      );
    }
  }

  void removeCase(RevengeCase caseUsed) {
    config = config.removeCases([caseUsed]);
    update();
  }

  void addCase(RevengeCase caseUsed) {
    config = config.addCases([caseUsed]);
    update();
  }

}
