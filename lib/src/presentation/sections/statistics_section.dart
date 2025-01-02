import 'package:flutter/material.dart';
import 'package:fourtrainer/src/presentation/helpers/four_grid_painter.dart';
import 'package:fourtrainer/src/presentation/helpers/kara_msg.dart';
import 'package:fourtrainer/src/presentation/helpers/strip_painter.dart';

import '../../domain/session.dart';
import '../../domain/session_time.dart';
import '../helpers/yu_sure_du.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({
    required this.sessions,
    required this.index,
    required this.onDelete,
    required this.onEdit,
    required this.onSessionChangedRequested,
    required this.isTimerRunning,
    super.key,
  });

  final List<Session> sessions;

  final int index;

  final bool isTimerRunning;

  final void Function(int) onSessionChangedRequested;

  final void Function(int) onDelete;

  final ValueChanged<(SessionTime, bool)> onEdit;

  @override
  Widget build(BuildContext context) {
    final session = sessions[index];
    final sessionReversed = session.times.reversed.toList();

    return Container(
      padding: const EdgeInsets.all(8),
      width: 300,
      height: double.infinity,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: Row(
                children: [
                  Expanded(
                    child: IgnorePointer(
                      child: DropdownButton(
                        value: session,
                        focusColor: Colors.transparent,
                        items: sessions.map(
                          (e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.name,
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (Session? value) {
                          karaMessage(context, 'Not supported yet, zmrde');
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      karaMessage(context, 'Not supported yet, zmrde');
                    },
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () {
                      yuSureDu(context).then(
                        (value) {
                          if (value) {
                            onDelete(index);
                          }
                        },
                      );
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
                    for (final time in sessionReversed)
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Time'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(time.toString()),
                                    const Divider(),
                                    if (time.scramble case final scramble?) ...[
                                      const Text('Scramble:'),
                                      Text(scramble),
                                    ],
                                    if (time.caseUsed case final caseUsed?) ...[
                                      Text(caseUsed.displayName, style: Theme.of(context).textTheme.titleMedium),
                                      GridWidget(
                                        gridColors: caseUsed.ui,
                                      ),
                                    ],
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            onEdit((
                                              time.copyWith(
                                                hasPenalty: !time.hasPenalty,
                                              ),
                                              false
                                            ));
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('+2'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            onEdit((
                                              time.copyWith(
                                                hasDNF: !time.hasDNF,
                                              ),
                                              false
                                            ));
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('DNF'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            pop() => Navigator.of(context).pop();
                                            yuSureDu(context).then(
                                              (value) {
                                                if (value) {
                                                  onEdit((time, true));
                                                  pop();
                                                }
                                              },
                                            );
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Oke'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          width: 80,
                          height: 40,
                          child: Center(
                            child: Text(time.toString()),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              width: double.infinity,
              child: CustomPaint(
                painter: StripedBorderPainter(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          'Count: ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: Text(
                          '${session.times.length}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Mean: ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: Text(
                          session.mean,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
