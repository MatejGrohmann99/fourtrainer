import 'package:flutter/material.dart';
import 'package:fourtrainer/domain/session_time.dart';
import 'package:fourtrainer/util/border.dart';
import 'package:fourtrainer/util/dialog.dart';
import 'package:get/get.dart';
import 'package:revenge_cube/revenge_cube.dart';

import '../services/session_bucket.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticsController>(
      init: StatisticsController(),
      builder: (controller) {
        final timesReversed = controller.session.times.reversed.toList();
        final isLargeTablet = context.isLargeTablet;

        if (isLargeTablet) {
          return Container(
            padding: const EdgeInsets.only(left: 36, right: 36),
            width: 400,
            height: double.infinity,
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.session.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.onClearSessionPressed(context);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: [
                          for (int i = timesReversed.length - 1; i >= 0; i--)
                            Builder(builder: (context) {
                              final reverseListIndex = timesReversed.length - 1 - i;
                              final time = timesReversed[reverseListIndex];
                              return InkWell(
                                onTap: () {
                                  controller.onTimeTapped(context, i);
                                },
                                child: SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: Center(
                                    child: Text(time.toString()),
                                  ),
                                ),
                              );
                            }),
                        ],
                      ),
                    ),
                  ),
                  BorderWidget(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Text(
                            'Count: ',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          trailing: Text(
                            '${controller.session.times.length}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            'Mean: ',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          trailing: Text(
                            controller.mean,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(8),
            height: 300,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.session.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.onClearSessionPressed(context);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          children: [
                            for (int i = timesReversed.length - 1; i >= 0; i--)
                              Builder(
                                builder: (context) {
                                  final reverseListIndex = timesReversed.length - 1 - i;
                                  final time = timesReversed[reverseListIndex];
                                  return InkWell(
                                    onTap: () {
                                      controller.onTimeTapped(context, i);
                                    },
                                    child: SizedBox(
                                      width: 80,
                                      height: 40,
                                      child: Center(
                                        child: Text(time.toString()),
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                    BorderWidget(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Text(
                              'Count: ',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            trailing: Text(
                              '${controller.session.times.length}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          ListTile(
                            leading: Text(
                              'Mean: ',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            trailing: Text(
                              controller.mean,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class TimeDetailDialog extends StatelessWidget {
  const TimeDetailDialog({required this.index, required this.time, super.key});

  final int index;
  final SessionTime time;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticsController>(builder: (controller) {
      return AlertDialog(
        title: const Text('Time'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(time.toString()),
            const Divider(),
            if (time.scramble case final scramble?) ...[
              const Text('Scramble:'),
              Text(scramble.scramble),
            ],
            if (time.scramble?.situation case final caseUsed?) ...[
              Text(caseUsed.displayName, style: Theme.of(context).textTheme.titleMedium),
              RevengeCubeWidget(
                gridColors: caseUsed.ui,
              ),
            ],
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    controller.penaltyToggled(index);
                  },
                  child: const Text('+2'),
                ),
                OutlinedButton(
                  onPressed: () {
                    controller.disqualificationToggled(index);
                  },
                  child: const Text('DNF'),
                ),
                OutlinedButton(
                  onPressed: () {
                    controller.deleteTimeToggled(context, index);
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Oke'),
          ),
        ],
      );
    });
  }
}

class StatisticsController extends GetxController {
  static StatisticsController get to => Get.find();

  var sessionIndex = 0;
  var session = SessionBucket().getInitialSession();

  String get mean {
    final timesWithoutDnf = List.from(session.times)..removeWhere((element) => element.hasDNF);
    if (timesWithoutDnf.isEmpty) {
      return '0:00';
    }
    final sum = timesWithoutDnf.fold<Duration>(
      Duration.zero,
      (previousValue, element) =>
          previousValue + element.duration + (element.hasPenalty ? const Duration(seconds: 2) : Duration.zero),
    );
    final average = Duration(milliseconds: sum.inMilliseconds ~/ timesWithoutDnf.length);
    return average.prettyString();
  }

  @override
  void onReady() {
    SessionBucket().getSessionFromPersistence(sessionIndex).then(
      (value) {
        if (value != null) {
          session = value;
          update();
        }
      },
    );
    super.onReady();
  }

  void onClearSessionPressed(BuildContext context) {
    DialogHandler().yuSureDu(context, message: 'You will lose your progress').then(
      (value) {
        if (value) {
          session = session.copyWith(times: []);
          syncStorage();
        }
      },
    );
  }

  void onTimeTapped(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return TimeDetailDialog(
          index: index,
          time: session.times[index],
        );
      },
    );
  }

  void penaltyToggled(int index) {
    final time = session.times[index];
    final newTime = time.copyWith(hasPenalty: !time.hasPenalty);
    session = session.updateTimeAt(index, newTime);
    syncStorage();
  }

  void disqualificationToggled(int index) {
    final time = session.times[index];
    final newTime = time.copyWith(hasDNF: !time.hasDNF);
    session = session.updateTimeAt(index, newTime);
    syncStorage();
  }

  void deleteTimeToggled(BuildContext context, int index) {
    pop() => Navigator.of(context).pop();
    DialogHandler().yuSureDu(context).then(
      (value) {
        if (value) {
          session = session.removeTimeAt(index);
          syncStorage();
          pop();
        }
      },
    );
  }

  void onAddTime(SessionTime time) {
    session = session.addTime(time);
    syncStorage();
  }

  void syncStorage() async {
    await SessionBucket().saveSessionToPersistence(
      session,
      sessionIndex,
    );
    update();
  }
}
