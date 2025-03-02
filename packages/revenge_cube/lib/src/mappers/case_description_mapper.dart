import 'package:revenge_cube/src/domain/enums/revenge_case.dart';

extension CaseDescriptionMapper on RevengeCase {
  String get categoryName {
    switch (this) {
      case RevengeCase.threeCycleBackGood:
      case RevengeCase.threeCycleFlippedJPerm:
      case RevengeCase.threeCycleUperm:
      case RevengeCase.threeCycleBackBad:
      case RevengeCase.threeCycleJperm:
      case RevengeCase.threeCycleFrontGood:
      case RevengeCase.threeCycleFrontBad:
      case RevengeCase.threeCycleFlippedUPerm:
        return '3-Cycle';
      case RevengeCase.fourCycleTwoSplitPairsSymmetricRight:
      case RevengeCase.fourCycleTwoSplitPairsSymmetricLeft:
      case RevengeCase.fourCycleSymmetricSmallPairs:
      case RevengeCase.fourCycleSymmetricBigPairs:
      case RevengeCase.fourCycleSymmetricFlippedPairs:
      case RevengeCase.fourCycleDiagonalSmallPairs:
      case RevengeCase.fourCycleDiagonalSmallLong:
      case RevengeCase.fourCycleDiagonalSmallLongFlipped:
      case RevengeCase.fourCycleSmallLeftLine:
      case RevengeCase.fourCycleSmallRightLine:
      case RevengeCase.fourCycleBigPairLeftLine:
      case RevengeCase.fourCycleBigPairRightLine:
      case RevengeCase.fourCycleAdjacentSmallPairs:
      case RevengeCase.fourCycleAdjacentBigPairs:
      case RevengeCase.fourCycleHydraulische:
      case RevengeCase.fourCycleOppositeBigPairs:
        return '4-Cycle';
      case RevengeCase.twoCycleAdjacentFlipped:
      case RevengeCase.twoCycleAdjacentOriented:
      case RevengeCase.twoCycleOppositeFlipped:
      case RevengeCase.twoCycleOppositeOriented:
      case RevengeCase.twoCyclesFLSlotFlipped:
      case RevengeCase.twoCyclesFLSlotOriented:
      case RevengeCase.twoCyclesFRSlotFlipped:
      case RevengeCase.twoCyclesFRSlotOriented:
        return '2 edges';
      case RevengeCase.twoTwoCycleHperm:
      case RevengeCase.twoTwoCycleFlipHperm:
      case RevengeCase.twoTwoCycleDotHperm:
      case RevengeCase.twoTwoCycleZperm:
      case RevengeCase.twoTwoCycleFlipZperm:
      case RevengeCase.twoTwoCycleDotZperm:
        return '2-2 Cycle';
      case RevengeCase.frSlot3_rightySplit:
      case RevengeCase.frSlot3_leftyLine:
      case RevengeCase.frSlot3_smallBlockLeft:
      case RevengeCase.frSlot3_rightyFlipousUp:
      case RevengeCase.frSlot3_bigBlockRight:
      case RevengeCase.frSlot3_leftyFlipousUp:
      case RevengeCase.frSlot3_leftySplit:
        return 'FR 3-Cycle';
    }
  }

  String get displayName => '$categoryName / $caseName';

  String get caseName {
    switch (this) {
      case RevengeCase.threeCycleBackGood:
        return 'Back Good';
      case RevengeCase.threeCycleFlippedJPerm:
        return 'Flipped J perm';
      case RevengeCase.threeCycleUperm:
        return 'U perm';
      case RevengeCase.threeCycleBackBad:
        return 'Back Bad';
      case RevengeCase.threeCycleJperm:
        return 'J Perm';
      case RevengeCase.threeCycleFrontGood:
        return 'Front Good';
      case RevengeCase.threeCycleFrontBad:
        return 'Front Bad';
      case RevengeCase.threeCycleFlippedUPerm:
        return 'Flipped U perm';
      case RevengeCase.fourCycleTwoSplitPairsSymmetricRight:
        return 'Two Split Pairs Symmetric Right';
      case RevengeCase.fourCycleTwoSplitPairsSymmetricLeft:
        return 'Two Split Pairs Symmetric Left';
      case RevengeCase.fourCycleSymmetricSmallPairs:
        return 'Symmetric Small Pairs';
      case RevengeCase.fourCycleSymmetricBigPairs:
        return 'Symmetric Big Pairs';
      case RevengeCase.fourCycleSymmetricFlippedPairs:
        return 'Symmetric Flipped Pairs';
      case RevengeCase.fourCycleDiagonalSmallPairs:
        return 'Diagonal Small Pairs';
      case RevengeCase.fourCycleDiagonalSmallLong:
        return 'Diagonal Small Long';
      case RevengeCase.fourCycleDiagonalSmallLongFlipped:
        return 'Diagonal Small Long Flipped';
      case RevengeCase.fourCycleSmallLeftLine:
        return 'Small Left Line';
      case RevengeCase.fourCycleSmallRightLine:
        return 'Small Right Line';
      case RevengeCase.fourCycleBigPairLeftLine:
        return 'Big Pair Left Line';
      case RevengeCase.fourCycleBigPairRightLine:
        return 'Big Pair Right Line';
      case RevengeCase.fourCycleAdjacentSmallPairs:
        return 'Adjacent Small Pairs';
      case RevengeCase.fourCycleAdjacentBigPairs:
        return 'Adjacent Big Pairs';
      case RevengeCase.fourCycleHydraulische:
        return 'Hydraulische';
      case RevengeCase.fourCycleOppositeBigPairs:
        return 'Opposite Big Pairs';
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
        return 'FR Slot Flipped';
      case RevengeCase.twoCyclesFRSlotOriented:
        return 'FR Slot Oriented';
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
