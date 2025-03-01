import 'package:flutter/material.dart';
import 'package:fourtrainer/features/edge_pairing_trainer/domain/session_time.dart';
import 'package:fourtrainer/util/border.dart';
import 'package:fourtrainer/util/dialog.dart';
import 'package:get/get.dart';
import 'package:revenge_cube/revenge_cube.dart';

import '../domain/session.dart';
import '../storage/session_bucket.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticsController>(
      init: StatisticsController(),
      builder: (controller) {
        if (controller.session.times.isEmpty) return const SizedBox.shrink();
        final timesReversed = controller.session.times.reversed.toList();
        final isLargeTablet = context.isLargeTablet;

        if (isLargeTablet) {
          return Container(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            width: 400,
            height: double.infinity,
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                colors: caseUsed.ui,
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

  var session = SessionBucket().session;

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
    SessionBucket().addListener(sessionListener);
    super.onReady();
  }

  @override
  void onClose() {
    SessionBucket().removeListener(sessionListener);
    super.onClose();
  }

  void sessionListener() {
    final session = SessionBucket().session;
    if (this.session != session) {
      this.session = session;
      update();
    }
  }

  void onClearSessionPressed(BuildContext context) {
    DialogHandler().yuSureDu(context, message: 'You will lose your progress').then(
      (value) {
        if (value) {
          syncStorage(session.copyWith(times: []));
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
    syncStorage(session.updateTimeAt(index, newTime));
  }

  void updateTime(SessionTime Function(SessionTime) newTime, int index) {
    syncStorage(session.updateTimeAt(index, newTime(session.times[index])));
  }

  void disqualificationToggled(int index) {
    final time = session.times[index];
    final newTime = time.copyWith(hasDNF: !time.hasDNF);
    syncStorage(session.updateTimeAt(index, newTime));
  }

  void deleteTimeToggled(BuildContext context, int index) {
    pop() => Navigator.of(context).pop();
    DialogHandler().yuSureDu(context).then(
      (value) {
        if (value) {
          syncStorage(session.removeTimeAt(index));
          pop();
        }
      },
    );
  }

  void syncStorage(Session session) async {
    await SessionBucket().saveSessionToPersistence(
      session,
    );
  }
}
