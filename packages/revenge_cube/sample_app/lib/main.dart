import 'package:flutter/material.dart';
import 'package:revenge_cube/revenge_cube.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final scrambleHandler = RevengeScrambler();

  final List<RevengeCase> casesSelected = [];
  RevengeScramble? scramble;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revenge Cube',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Revenge Cube'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              spacing: 16,
              children: [
                Text('Scramble: ${scramble?.scramble}'),
                Text('Name: ${scramble?.situation?.displayName}'),
                RevengeCubeWidget(
                  gridColors: scramble?.situation?.ui,
                ),
                Text('Algorithm: ${scramble?.situation?.alg}'),
                ElevatedButton(
                  onPressed: () {
                    final newScramble = scrambleHandler.generateScramble(
                      casesSelected: casesSelected,
                      randomizeAuf: true,
                    );
                    setState(() {
                      scramble = newScramble;
                    });
                  },
                  child: const Text('Generate Scramble'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      casesSelected.clear();
                    });
                  },
                  child: const Text('Clear Selection'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        casesSelected.addAll(RevengeCase.topLayer3cycles);
                      },
                    );
                  },
                  child: const Text('Add 3 cycles'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        casesSelected.addAll(RevengeCase.topLayer4cycles);
                      },
                    );
                  },
                  child: const Text('Add 4 cycles'),
                ),
                Wrap(
                  children: [
                    for (final caseSelected in casesSelected)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          color: Colors.white70,
                          width: 200,
                          height: 200,
                          child: ListTile(
                            onLongPress: () {
                              setState(
                                () {
                                  scramble = scrambleHandler.generateScramble(
                                    casesSelected: [caseSelected],
                                    randomizeAuf: true,
                                  );
                                },
                              );
                            },
                            onTap: () {
                              setState(() {
                                casesSelected.remove(caseSelected);
                              });
                            },
                            title: Text(
                              caseSelected.displayName,
                            ),
                            subtitle: RevengeCubeWidget(
                              width: 50,
                              height: 50,
                              gridColors: caseSelected.ui,
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
