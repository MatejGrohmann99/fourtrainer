import 'package:fourtrainer/src/domain/algorithms/four_cycle_setup_algorithms.g.dart';

import 'algorithms/four_flip_algorithms.g.dart';
import 'algorithms/no_top_flip_algorithms.g.dart';
import 'algorithms/three_cycle_setup_algorithms.g.dart';
import 'algorithms/ub_flip_algorithms.g.dart';
import 'algorithms/uf_flip_algorithms.g.dart';
import 'algorithms/uf_ur_ub_flip_algorithms.g.dart';
import 'algorithms/ufub_flip_algorithms.g.dart';
import 'algorithms/ufur_flip_algorithms.g.dart';
import 'algorithms/ur_flip_algorithms.g.dart';
import 'algorithms/urbu_flip_algorithms.g.dart';

enum Case {
  /// THREE CYCLES
  threeCycleBackGood(Setup.ufurubFlipSetup, Setup.threeCycleSetup),
  threeCycleFlippedJPerm(Setup.ufurFlipSetup, Setup.threeCycleSetup),
  threeCycleUperm(Setup.urubFlipSetup, Setup.threeCycleSetup),
  threeCycleBackBad(Setup.noFlipSetup, Setup.threeCycleSetup),
  threeCycleJperm(Setup.ufFlipSetup, Setup.threeCycleSetup),
  threeCycleFrontGood(Setup.urFlipSetup, Setup.threeCycleSetup),
  threeCycleFrontBad(Setup.ufubFlipSetup, Setup.threeCycleSetup),
  threeCycleFlippedUPerm(Setup.ubFlipSetup, Setup.threeCycleSetup),

  /// FOUR CYCLES
  fourCycleTwoSplitPairsSymmetricRight(Setup.noFlipSetup, Setup.fourCycleSetup),
  fourCycleTwoSplitPairsSymmetricLeft(Setup.fourFlipSetup, Setup.fourCycleSetup),
  ;

  const Case(this.setup, this.adjust);

  final Setup adjust;
  final Setup setup;

  String toJsonString() {
    switch (this) {
      case Case.threeCycleBackGood:
        return 'threeCycleBackGood';
      case Case.threeCycleFlippedJPerm:
        return 'threeCycleFlippedJPerm';
      case Case.threeCycleUperm:
        return 'threeCycleUperm';
      case Case.threeCycleBackBad:
        return 'threeCycleBackBad';
      case Case.threeCycleJperm:
        return 'threeCycleJperm';
      case Case.threeCycleFrontGood:
        return 'threeCycleFrontGood';
      case Case.threeCycleFrontBad:
        return 'threeCycleFrontBad';
      case Case.threeCycleFlippedUPerm:
        return 'threeCycleFlippedUPerm';
      case Case.fourCycleTwoSplitPairsSymmetricRight:
        return 'fourCycleTwoSplitPairsSymmetricRight';
      case Case.fourCycleTwoSplitPairsSymmetricLeft:
        return 'fourCycleTwoSplitPairsSymmetricLeft';
    }
  }

  static Case? fromJsonString(String? json) {
    switch (json) {
      case 'threeCycleBackGood':
        return Case.threeCycleBackGood;
      case 'threeCycleFlippedJPerm':
        return Case.threeCycleFlippedJPerm;
      case 'threeCycleUperm':
        return Case.threeCycleUperm;
      case 'threeCycleBackBad':
        return Case.threeCycleBackBad;
      case 'threeCycleJperm':
        return Case.threeCycleJperm;
      case 'threeCycleFrontGood':
        return Case.threeCycleFrontGood;
      case 'threeCycleFrontBad':
        return Case.threeCycleFrontBad;
      case 'threeCycleFlippedUPerm':
        return Case.threeCycleFlippedUPerm;
      case 'fourCycleTwoSplitPairsSymmetricRight':
        return Case.fourCycleTwoSplitPairsSymmetricRight;
      case 'fourCycleTwoSplitPairsSymmetricLeft':
        return Case.fourCycleTwoSplitPairsSymmetricLeft;
      case _:
        return null;
    }
  }

  static const threeCycleCasesList = [
    Case.threeCycleBackGood,
    Case.threeCycleFlippedJPerm,
    Case.threeCycleUperm,
    Case.threeCycleBackBad,
    Case.threeCycleJperm,
    Case.threeCycleFrontGood,
    Case.threeCycleFrontBad,
    Case.threeCycleFlippedUPerm
  ];

  static const fourCycleCasesList = [
    Case.fourCycleTwoSplitPairsSymmetricRight,
    Case.fourCycleTwoSplitPairsSymmetricLeft,
  ];

  Map<(int, int), Sticker> get ui {
    switch (this) {
      case Case.threeCycleBackGood:
        return {
          // TOP EDGE
          (0, 2): Sticker.blue,
          (0, 3): Sticker.green,
          (1, 2): Sticker.yellow,
          (1, 3): Sticker.orange,
          // BOTTOM EDGE
          (5, 2): Sticker.yellow,
          (5, 3): Sticker.yellow,
          (4, 2): Sticker.red,
          (4, 3): Sticker.blue,
          // SIDE EDGE
          (2, 5): Sticker.green,
          (3, 5): Sticker.red,
          (2, 4): Sticker.orange,
          (3, 4): Sticker.yellow,
        };
      case Case.threeCycleFlippedJPerm:
        return {
          // TOP EDGE
          (0, 2): Sticker.orange,
          (0, 3): Sticker.green,
          (1, 2): Sticker.yellow,
          (1, 3): Sticker.yellow,
          // BOTTOM EDGE
          (5, 2): Sticker.red,
          (5, 3): Sticker.green,
          (4, 2): Sticker.yellow,
          (4, 3): Sticker.yellow,
          // SIDE EDGE

          (2, 4): Sticker.orange,
          (3, 4): Sticker.red,
          (2, 5): Sticker.yellow,
          (3, 5): Sticker.yellow,
        };
      case Case.threeCycleUperm:
        return {
          // TOP EDGE
          (0, 2): Sticker.green,
          (0, 3): Sticker.orange,
          (1, 2): Sticker.yellow,
          (1, 3): Sticker.yellow,
          // BOTTOM EDGE
          (5, 2): Sticker.green,
          (5, 3): Sticker.red,
          (4, 2): Sticker.yellow,
          (4, 3): Sticker.yellow,
          // SIDE EDGE

          (2, 5): Sticker.red,
          (3, 5): Sticker.orange,
          (2, 4): Sticker.yellow,
          (3, 4): Sticker.yellow,
        };
      case Case.threeCycleBackBad:
        return {
          // TOP EDGE
          (0, 2): Sticker.red,
          (0, 3): Sticker.green,
          (1, 2): Sticker.yellow,
          (1, 3): Sticker.orange,
          // BOTTOM EDGE
          (5, 2): Sticker.orange,
          (5, 3): Sticker.green,
          (4, 2): Sticker.green,
          (4, 3): Sticker.red,
          // SIDE EDGE

          (2, 4): Sticker.green,
          (3, 4): Sticker.red,
          (2, 5): Sticker.red,
          (3, 5): Sticker.yellow,
        };
      case Case.threeCycleJperm:
        return {
          // TOP EDGE
          (0, 2): Sticker.red,
          (0, 3): Sticker.green,
          (1, 2): Sticker.yellow,
          (1, 3): Sticker.orange,
          // BOTTOM EDGE
          (5, 2): Sticker.red,
          (5, 3): Sticker.green,
          (4, 2): Sticker.green,
          (4, 3): Sticker.orange,
          // SIDE EDGE
          (2, 4): Sticker.green,
          (3, 4): Sticker.yellow,
          (2, 5): Sticker.red,
          (3, 5): Sticker.red,
        };
      case Case.threeCycleFrontGood:
        return {
          // TOP EDGE
          (0, 2): Sticker.red,
          (0, 3): Sticker.green,
          (1, 2): Sticker.yellow,
          (1, 3): Sticker.orange,
          // BOTTOM EDGE
          (5, 2): Sticker.orange,
          (5, 3): Sticker.green,
          (4, 2): Sticker.green,
          (4, 3): Sticker.red,
          // SIDE EDGE
          (2, 4): Sticker.red,
          (3, 4): Sticker.red,
          (2, 5): Sticker.yellow,
          (3, 5): Sticker.green,
        };
      case Case.threeCycleFrontBad:
        return {
          // TOP EDGE
          (0, 2): Sticker.blue,
          (0, 3): Sticker.green,
          (1, 2): Sticker.yellow,
          (1, 3): Sticker.orange,
          // BOTTOM EDGE
          (5, 2): Sticker.yellow,
          (5, 3): Sticker.yellow,
          (4, 2): Sticker.red,
          (4, 3): Sticker.blue,
          // SIDE EDGE
          (2, 5): Sticker.yellow,
          (3, 5): Sticker.orange,
          (2, 4): Sticker.red,
          (3, 4): Sticker.green,
        };
      case Case.threeCycleFlippedUPerm:
        return {
          // TOP EDGE
          (0, 2): Sticker.green,
          (0, 3): Sticker.red,
          (1, 2): Sticker.orange,
          (1, 3): Sticker.blue,
          // BOTTOM EDGE
          (5, 2): Sticker.green,
          (5, 3): Sticker.red,
          (4, 2): Sticker.orange,
          (4, 3): Sticker.yellow,
          // SIDE EDGE
          (2, 5): Sticker.yellow,
          (3, 5): Sticker.blue,
          (2, 4): Sticker.red,
          (3, 4): Sticker.red,
        };
      case Case.fourCycleTwoSplitPairsSymmetricRight:
        return {
          // TOP EDGE
          (0, 2): Sticker.yellow,
          (0, 3): Sticker.blue,
          (1, 2): Sticker.orange,
          (1, 3): Sticker.red,
          // BOTTOM EDGE
          (5, 2): Sticker.blue,
          (5, 3): Sticker.orange,
          (4, 2): Sticker.orange,
          (4, 3): Sticker.yellow,
          // SIDE EDGE
          (2, 5): Sticker.red,
          (3, 5): Sticker.red,
          (2, 4): Sticker.yellow,
          (3, 4): Sticker.blue,
          // SIDE EDGE LEFTOUS
          (2, 0): Sticker.orange,
          (3, 0): Sticker.yellow,
          (2, 1): Sticker.blue,
          (3, 1): Sticker.red,
        };
      case Case.fourCycleTwoSplitPairsSymmetricLeft:
        return {
          // TOP EDGE
          (0, 2): Sticker.blue,
          (0, 3): Sticker.red,
          (1, 2): Sticker.orange,
          (1, 3): Sticker.yellow,
          // BOTTOM EDGE
          (5, 2): Sticker.yellow,
          (5, 3): Sticker.blue,
          (4, 2): Sticker.red,
          (4, 3): Sticker.red,
          // SIDE EDGE
          (2, 5): Sticker.red,
          (3, 5): Sticker.orange,
          (2, 4): Sticker.blue,
          (3, 4): Sticker.yellow,
          // SIDE EDGE LEFTOUS
          (2, 0): Sticker.yellow,
          (3, 0): Sticker.orange,
          (2, 1): Sticker.orange,
          (3, 1): Sticker.blue,
        };
    }
  }

  String get displayName {
    switch (this) {
      case Case.threeCycleBackGood:
        return '3-Cycle / Back Good';
      case Case.threeCycleFlippedJPerm:
        return '3-Cycle / Flipped J perm';
      case Case.threeCycleUperm:
        return '3-Cycle / U perm';
      case Case.threeCycleBackBad:
        return '3-Cycle / Back Bad';
      case Case.threeCycleJperm:
        return '3-Cycle / J Perm';
      case Case.threeCycleFrontGood:
        return '3-Cycle / Front Good';
      case Case.threeCycleFrontBad:
        return '3-Cycle / Front Bad';
      case Case.threeCycleFlippedUPerm:
        return '3-Cycle / flipped U perm';
      case Case.fourCycleTwoSplitPairsSymmetricRight:
        return '4-Cycle / Two Split Pairs Symmetric Right';
      case Case.fourCycleTwoSplitPairsSymmetricLeft:
        return '4-Cycle / Two Split Pairs Symmetric Left';
    }
  }
}

enum Sticker {
  green,
  red,
  blue,
  orange,
  white,
  yellow,
}

enum Setup {
  fourCycleSetup,
  threeCycleSetup,
  ufurubFlipSetup,
  ufurFlipSetup,
  ufubFlipSetup,
  urubFlipSetup,
  ufFlipSetup,
  urFlipSetup,
  ubFlipSetup,
  noFlipSetup,
  fourFlipSetup,
  ;

  List<String> getAlgorithms() {
    switch (this) {
      case Setup.fourCycleSetup:
        return fourCycleSetupAlgorithms;
      case Setup.threeCycleSetup:
        return threeCycleSetupAlgorithms;
      case Setup.ufurubFlipSetup:
        return ufurubFlipAlgorithms;
      case Setup.ufurFlipSetup:
        return ufurFlipAlgorithms;
      case Setup.ufubFlipSetup:
        return ufubFlipAlgorithms;
      case Setup.urubFlipSetup:
        return urbuFlipAlgorithms;
      case Setup.ufFlipSetup:
        return ufFlipAlgorithms;
      case Setup.urFlipSetup:
        return urFlipAlgorithms;
      case Setup.ubFlipSetup:
        return ubFlipAlgorithms;
      case Setup.noFlipSetup:
        return noTopFlipAlgorithm;
      case Setup.fourFlipSetup:
        return fourFlipAlgorithms;
    }
  }
}
