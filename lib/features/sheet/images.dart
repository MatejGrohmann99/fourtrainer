import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revenge_cube/revenge_cube.dart';

class ImagesSheet extends StatelessWidget {
  const ImagesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RevengeCase> cases = [
      ...RevengeCase.twoCycleCases,
      ...RevengeCase.topLayer3cycles,
      ...RevengeCase.twoTwoCycleCases,
      ...RevengeCase.topLayer4cycles
    ];

    final List<(int, RevengeCase)> totalCases = [];

    const casesIndex = [-1, 0, 1, 2, 3, 4, 5, 6, 7];

    for (final situation in cases) {
      for (int i = 0; i < cases.length; i++) {
        final index = i;
        final caseIndex = casesIndex[index];
        totalCases.add((caseIndex, situation));
      }
    }

    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Good luck with that sheet'),
        ),
        body: ListView.separated(
          itemCount: cases.length,
          itemBuilder: (ctx, index) => SheetCase(
            name: cases[index].caseName,
            situation: cases[index],
            algs: [],
          ),
          separatorBuilder: (cxt, index) => const Divider(),
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
    const cases = [-1, 0, 1, 2, 3, 4, 5, 6, 7];
    return Wrap(
      children: [
        for (int ccc in cases)
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          name + '(index pyco ${ccc})',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RevengeCubeWidget(
                            width: 90,
                            height: 90,
                            override: OverrideZmrd.indexujo(ccc),
                            colors: situation.ui,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
