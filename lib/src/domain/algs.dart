import 'package:cube_core/cube_core.dart';
import 'package:fourtrainer/src/application/scramble_handler.dart';
import 'package:fourtrainer/src/domain/case.dart';

extension Algs on Case {
  String get alg {
    return switch (this) {
      /// THREE CYCLES
      Case.threeCycleBackGood => "Rw U R' U' r'",
      Case.threeCycleFlippedJPerm => "R U' R' U R' Rw U R U' Rw'",
      Case.threeCycleUperm => "U' Rw U Rw' U Rw' U' Rw2 U' Rw' U Rw' U Rw",
      Case.threeCycleBackBad => "Lw' R U R' U' Lw",
      Case.threeCycleJperm => "Rw U2 Rw' U Rw U2 Rw' U2 Rw U' Rw'",
      Case.threeCycleFrontGood => "Rw' U' R U r",
      Case.threeCycleFrontBad => "Lw R' U' R U Lw'",
      Case.threeCycleFlippedUPerm => "R U' R' U Rw' F R F' r",
      Case.fourCycleTwoSplitPairsSymmetricRight => "",
      Case.fourCycleTwoSplitPairsSymmetricLeft => "",
    };
  }

  String get setupMoves {
    final adjustTrigger = adjust.getAlgorithms().first;
    final setupTrigger = setup.getAlgorithms().first;
    return ScrambleHandler.fiveMover + adjustTrigger + ScrambleHandler.fiveMover + setupTrigger;
  }
}
