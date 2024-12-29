
import 'package:flutter/material.dart';

import '../../state.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({required this.session, required this.onDelete, super.key});

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
              icon: const Icon(Icons.delete_forever),
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