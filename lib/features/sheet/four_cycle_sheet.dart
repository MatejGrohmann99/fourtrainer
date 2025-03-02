import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revenge_cube/revenge_cube.dart';

class FourCycleSheet extends StatelessWidget {
  const FourCycleSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Four Cycle Sheet'),
        ),
        body: ListView(
          children: [
            SheetCase(
              name: 'Symme Symme Symme',
              situation: RevengeCase.fourCycleSymmetricSmallPairs,
              algs: [
                "r' U Rw U2 Rw' U2 Rw U' Rw' U R U R' r",
                "L Rw' U' R U r Uw2 L' U L Uw2 L'"
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SheetCase extends StatelessWidget {
  const SheetCase({required this.name, required this.situation, required this.algs, super.key});

  final String name;
  final RevengeCase situation;
  final List<String> algs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RevengeCubeWidget(
                    colors: situation.ui,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final alg in algs)
                        Row(
                          children: [
                            Text(
                              alg,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text: alg,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
