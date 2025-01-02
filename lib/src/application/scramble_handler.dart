import 'dart:math';

import 'package:cube_core/cube_core.dart';
import 'package:fourtrainer/src/domain/case.dart';
import 'package:fourtrainer/src/domain/settings_config.dart';

class ScrambleHandler {
  static const fiveMover = "r U R U' Rw' ";

  ScrambleHandler();

  final random = Random();

  (String, Case?)? generateScramble(SettingsConfig config) {
    final bucket = List.from(config.casesSelected);
    if (bucket.isEmpty) return null;

    bucket.shuffle();
    final last = bucket.last;

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
    if (config.randomizeAuf) {
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

    return (
      fiveMover + preSetup + fiveMover + setup,
      last,
    );
  }
}
