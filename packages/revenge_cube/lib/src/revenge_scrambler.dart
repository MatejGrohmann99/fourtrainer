import 'dart:math';

import 'package:cube_core/cube_core.dart';
import 'package:revenge_cube/src/domain/enums/revenge_case.dart';
import 'package:revenge_cube/src/domain/revenge_scramble.dart';

class RevengeScrambler {
  final random = Random();

  RevengeScramble? generateScramble({
    required List<RevengeCase> casesSelected,
    required bool randomizeAuf,
  }) {
    final bucket = List.from(casesSelected);
    if (bucket.isEmpty) return null;

    bucket.shuffle();
    final last = bucket.last;

    final trigger = last.trigger.getAlgorithms().elementAt(
          random.nextInt(
            last.trigger.getAlgorithms().length,
          ),
        );

    final preSetup = last.adjust.getAlgorithms().elementAt(
          random.nextInt(
            last.adjust.getAlgorithms().length,
          ),
        );

    var setup = last.setup.getAlgorithms().elementAt(
          random.nextInt(
            last.setup.getAlgorithms().length,
          ),
        );
    if (randomizeAuf) {
      var algorithmFormat = AlgService().getAlgorithmFromString(setup);
      if (algorithmFormat.last == CM.U || algorithmFormat.last == CM.U2 || algorithmFormat.last == CM.Ui) {
        algorithmFormat.removeLast();
      }
      final randomUMove = [CM.U, CM.U2, CM.Ui, CM.R].elementAt(random.nextInt(3));
      if (randomUMove != CM.R) {
        algorithmFormat.add(randomUMove);
      }
      setup = AlgService().convertAlgorithmToString(algorithmFormat);
    }

    return RevengeScramble(
      scramble: '$trigger $preSetup $trigger $setup'.replaceAll('  ', ' '),
      situation: last,
    );
  }
}
