import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourtrainer/util/snackbar.dart';
import 'package:get/get.dart';

import 'alg_sheet.dart';

class AlgSheetView extends StatelessWidget {
  const AlgSheetView({
    required this.sheets,
    super.key,
  });

  final List<AlgSheet> sheets;

  @override
  Widget build(BuildContext context) {
    final typography = context.textTheme;
    return Scaffold(
        body: ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) {
        return Container(color: Colors.white, width: 2);
      },
      itemBuilder: (context, index) {
        final sheet = sheets[index];
        return ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: sheet.algorithms.length,
          itemBuilder: (context, index) {
            final item = sheet.algorithms[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 240,
                    height: 240,
                    child: sheet.imageBuilder(item),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          children: [
                            Text(item.name, style: typography.displaySmall),
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(text: item.algorithm),
                                ).then(
                                  (_) {
                                    if (context.mounted) {
                                      SnackBarHandler().karaMessage(context, 'Algorithm copied');
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Text(
                        item.algorithm.replaceAll(' ', "   "),
                        style: typography.titleLarge,
                      ),
                      if (item.alternativeAlgorithms.isNotEmpty)
                        for (final altAlg in item.alternativeAlgorithms)
                          Text(
                            altAlg.replaceAll(' ', "   "),
                            style: typography.titleMedium,
                          ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
      itemCount: sheets.length,
    ));
  }
}
