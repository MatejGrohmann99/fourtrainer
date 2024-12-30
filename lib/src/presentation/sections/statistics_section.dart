import 'package:flutter/material.dart';

import '../../domain/session_time.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({required this.session, required this.onDelete, required this.onEdit, super.key});

  final List<SessionTime> session;
  final VoidCallback onDelete;

  final ValueChanged<(SessionTime, bool)> onEdit;

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
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(time.toString()),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Text('Count: ${session.length}'),
            ElevatedButton.icon(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                yuSureDu(context).then((value) {
                  if (value) {
                    onDelete();
                  }
                });
              },
              label: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> yuSureDu(BuildContext context) async =>
    await showDialog<bool>(
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
                Navigator.of(context).pop(true);
              },
              child: const Text('Oke'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('NO'),
            ),
          ],
        );
      },
    ) ??
    false;
