import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revenge_cube/revenge_cube.dart';

class OllImageHelperPage extends StatefulWidget {
  const OllImageHelperPage({super.key});

  @override
  State<OllImageHelperPage> createState() => _OllImageHelperPageState();
}

class _OllImageHelperPageState extends State<OllImageHelperPage> {
  var gridColorsOverride = <List<Sticker?>>[
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
    [null, null, S.y, S.y, null, null],
    [null, null, S.y, S.y, null, null],
    [null, null, null, null, null, null],
    [null, null, null, null, null, null],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Click on tile to make it yellow/grey',
                style: context.textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 64),
            Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  children: [
                    RevengeCubeWidget(
                      height: 300,
                      width: 300,
                      gridColorsOverride: gridColorsOverride,
                    ),
                    Column(
                      children: [
                        for (var c = 0; c < 6; c++)
                          Row(
                            children: [
                              for (var i = 0; i < 6; i++)
                                Center(
                                  child: InkWell(
                                    onTap: () => _onTileTap(c, i),
                                    child: const SizedBox(
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTileTap(int c, int i) {
    if (gridColorsOverride[c][i] case final val?) {
      gridColorsOverride[c][i] = null;
    } else {
      gridColorsOverride[c][i] = S.y;
    }
    setState(() {});
  }
}
