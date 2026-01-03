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
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              children: [

                for (final item in [ ...RevengeCase.twoTwoCycleCases, ...RevengeCase.topLayer4cycles])
                  SheetCase(
                    name: item.caseName,
                    situation: item,
                    algs: [
                      item.alg
                    ],
                  ),
              ],
            ),
          ),
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
    return SizedBox(
      width: 525,
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
                    name,
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
                      colors: situation.ui,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (final alg in algs)
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    alg,
                                    style: Theme.of(context).textTheme.labelLarge,overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
