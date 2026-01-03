import 'package:revenge_cube/src/domain/enums/revenge_case.dart';

extension AlgorithmMapper on RevengeCase {
  String get alg {
    switch (this) {
      case RevengeCase.threeCycleBackGood:
        return "Rw U R' U' r'";
      case RevengeCase.threeCycleFlippedJPerm:
        return "R U' R' U r U R U' Rw'";
      case RevengeCase.threeCycleUperm:
        return "U' Rw U Rw' U Rw' U' Rw2 U' Rw' U Rw' U Rw'";
      case RevengeCase.threeCycleBackBad:
        return "Lw' R U R' U' Lw";
      case RevengeCase.threeCycleJperm:
        return "Rw U2 Rw' U Rw U2 Rw' U2 Rw U' Rw' ";
      case RevengeCase.threeCycleFrontGood:
        return "Rw' U' R U r";
      case RevengeCase.threeCycleFrontBad:
        return "Lw R' U' R U Lw'";
      case RevengeCase.threeCycleFlippedUPerm:
        return "R U R' U r U R U' Rw'";
      case RevengeCase.fourCycleTwoSplitPairsSymmetricRight:
        return "U' R U' R' Rw U Rw' U Rw U Rw' U Rw U Rw'";
      case RevengeCase.fourCycleTwoSplitPairsSymmetricLeft:
        return "U' R U R' U2 Rw U Rw' U Rw U Rw' U Rw U Rw'";
      case RevengeCase.fourCycleSymmetricSmallPairs:
        return "r' U Rw U2 Rw' U2 Rw U' Rw' U R U R' r";
      case RevengeCase.fourCycleSymmetricBigPairs:
        return "Rw U Rw' U2 F' U' F U' Rw U' Rw'";
      case RevengeCase.fourCycleSymmetricFlippedPairs:
        return "Rw U' Rw2 U2 R U R' U Rw2 U Rw'";
      case RevengeCase.fourCycleDiagonalSmallPairs:
        return "Rw' U' Rw R2 F R F' R Rw' U Rw";
      case RevengeCase.fourCycleDiagonalSmallLong:
        return "U' Rw U' Rw' U' r U2 r' U Rw U Rw'";
      case RevengeCase.fourCycleDiagonalSmallLongFlipped:
        return "r' U' Rw U' R' U2 R U' Rw' U r";
      case RevengeCase.fourCycleSmallLeftLine:
        return "U' Rw U' Rw2 U' R U' R' U2 Rw2 U Rw'";
      case RevengeCase.fourCycleSmallRightLine:
        return "Rw' U Rw2 U R' U R U2 Rw2 U' Rw";
      case RevengeCase.fourCycleBigPairLeftLine:
        return "U' R U2 R' Rw U' Rw' U' Rw U' Rw' U' Rw U' Rw'";
      case RevengeCase.fourCycleBigPairRightLine:
        return "U r' U' Rw U R' U Rw' U2 Rw U Rw' U2 Rw";
      case RevengeCase.fourCycleAdjacentSmallPairs:
        return "U' Rw U R' U' Rw' R2 U' R2 Rw U R U' Rw'";
      case RevengeCase.fourCycleAdjacentBigPairs:
        return "F U2 Rw U Rw' U Rw U Rw' U Rw U Rw' F'";
      case RevengeCase.fourCycleHydraulische:
        return "U Rw' U2 R U R' U Rw U' Rw' U' R U r";
      case RevengeCase.fourCycleOppositeBigPairs:
        return "R U R' U' Rw U Rw' U R U2 R' U Rw U' Rw'";
      case RevengeCase.twoCycleAdjacentFlipped:
        return 'Adjacent Flipped';
      case RevengeCase.twoCycleAdjacentOriented:
        return 'Adjacent Oriented';
      case RevengeCase.twoCycleOppositeFlipped:
        return 'Opposite Flipped';
      case RevengeCase.twoCycleOppositeOriented:
        return 'Opposite Oriented';
      case RevengeCase.twoCyclesFLSlotFlipped:
        return 'FL Slot Flipped';
      case RevengeCase.twoCyclesFLSlotOriented:
        return 'FL Slot Oriented';
      case RevengeCase.twoCyclesFRSlotFlipped:
        return "U Rw' F2 Rw2 U' Rw2 F2 Rw2 U Rw'";
      case RevengeCase.twoCyclesFRSlotOriented:
        return "U' Lw' U2 Rw' D' Rw U2 Rw' D Rw Lw";
      case RevengeCase.twoTwoCycleHperm:
        return 'H perm';
      case RevengeCase.twoTwoCycleFlipHperm:
        return 'Flip H perm';
      case RevengeCase.twoTwoCycleDotHperm:
        return 'Dot H perm';
      case RevengeCase.twoTwoCycleZperm:
        return 'Z perm';
      case RevengeCase.twoTwoCycleFlipZperm:
        return 'Flip Z perm';
      case RevengeCase.twoTwoCycleDotZperm:
        return 'Dot Z perm';
      case RevengeCase.frSlot3_rightySplit:
        return 'Righty Split';
      case RevengeCase.frSlot3_leftyLine:
        return 'Lefty Line';
      case RevengeCase.frSlot3_smallBlockLeft:
        return 'Small Block Left';
      case RevengeCase.frSlot3_rightyFlipousUp:
        return 'Righty Flipouš Up';
      case RevengeCase.frSlot3_bigBlockRight:
        return 'Big block right';
      case RevengeCase.frSlot3_leftyFlipousUp:
        return 'Lefty Flipouš Up';
      case RevengeCase.frSlot3_leftySplit:
        return 'Lefty Split';
    }
  }
}
