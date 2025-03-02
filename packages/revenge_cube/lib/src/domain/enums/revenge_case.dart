//ignore_for_file: named_constructors, constant_identifier_names
import 'package:collection/collection.dart';
import 'package:revenge_cube/src/domain/enums/setup.dart';

import '../../algorithms/better/better_setup.dart';
import '../lazy_setup.dart';

enum RevengeCase {
  /// TWO CYCLES
  twoCycleOppositeOriented(
    setup: Setup.noFlipSetup,
    adjust: Setup.twoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoCycleOppositeOriented',
  ),
  twoCycleOppositeFlipped(
    setup: Setup.ufFlipSetup,
    adjust: Setup.twoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoCycleOppositeFlipped',
  ),
  twoCycleAdjacentOriented(
    setup: Setup.urubswapulflipSetup,
    adjust: Setup.twoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoCycleAdjacentOriented',
  ),
  twoCycleAdjacentFlipped(
    setup: Setup.ufurSwapTwistUF,
    adjust: Setup.twoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoCycleAdjacentFlipped',
  ),
  twoCyclesFLSlotOriented(
    setup: Setup.ublfSwapSetup,
    adjust: Setup.twoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoCyclesFLSlotOriented',
  ),
  twoCyclesFLSlotFlipped(
    setup: Setup.leftSexiMoveSetup,
    adjust: Setup.twoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoCyclesFLSlotFlipped',
  ),
  twoCyclesFRSlotOriented(
    setup: Setup.ubrfSwapSetup,
    adjust: Setup.twoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoCyclesFRSlotOriented',
  ),
  twoCyclesFRSlotFlipped(
    setup: Setup.rightSexiMoveSetup,
    adjust: Setup.twoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoCyclesFRSlotFlipped',
  ),

  /// THREE CYCLES
  threeCycleBackGood(
    setup: Setup.ufurubFlipSetup,
    adjust: Setup.threeCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'threeCycleBackGood',
  ),
  threeCycleFlippedJPerm(
    setup: Setup.ufurFlipSetup,
    adjust: Setup.threeCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'threeCycleFlippedJPerm',
  ),
  threeCycleUperm(
    setup: Setup.urubFlipSetup,
    adjust: Setup.threeCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'threeCycleUperm',
  ),
  threeCycleBackBad(
    setup: Setup.noFlipSetup,
    adjust: Setup.threeCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'threeCycleBackBad',
  ),
  threeCycleJperm(
    setup: Setup.ufFlipSetup,
    adjust: Setup.threeCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'threeCycleJperm',
  ),
  threeCycleFrontGood(
    setup: Setup.urFlipSetup,
    adjust: Setup.threeCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'threeCycleFrontGood',
  ),
  threeCycleFrontBad(
    setup: Setup.ufubFlipSetup,
    adjust: Setup.threeCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'threeCycleFrontBad',
  ),
  threeCycleFlippedUPerm(
    setup: Setup.ubFlipSetup,
    adjust: Setup.threeCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'threeCycleFlippedUPerm',
  ),

  /// 3 CYCLES FR SLOT
  frSlot3_rightySplit(
    setup: LazySetup(BetterSetupExtension.UFUBFRNoSwapAlgorithm_constValue),
    adjust: Setup.fInverseSexiSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'frSlot3_rightySplit',
  ),
  frSlot3_leftyLine(
    setup: LazySetup(BetterSetupExtension.UBRFSwapUFWontMoveAlgorithm_constValue),
    adjust: Setup.fInverseSexiSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'frSlot3_leftyLine',
  ),
  frSlot3_smallBlockLeft(
    setup: LazySetup(BetterSetupExtension.FInvSexiButFrWontMoveAlgorithm_constValue),
    adjust: Setup.fInverseSexiSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'frSlot3_smallBlockLeft',
  ),
  frSlot3_rightyFlipousUp(
    setup: LazySetup(BetterSetupExtension.LUFUbutFRwontMoveAlgorithm_constValue),
    adjust: Setup.fInverseSexiSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'frSlot3_rightyFlipousUp',
  ),
  frSlot3_bigBlockRight(
    setup: LazySetup(BetterSetupExtension.RUFUbutFRwontMoveAlgorithm_constValue),
    adjust: Setup.fInverseSexiSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'frSlot3_bigBlockRight',
  ),
  frSlot3_leftyFlipousUp(
    setup: Setup.rightSexiMoveSetup,
    adjust: Setup.fInverseSexiSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'frSlot3_leftyFlipousUp',
  ),
  frSlot3_leftySplit(
    setup: LazySetup(BetterSetupExtension.UFUBFlipFRWontMoveAlgorithm_constValue),
    adjust: Setup.fInverseSexiSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'frSlot3_leftySplit',
  ),

  /// 2-2 CYCLES
  twoTwoCycleHperm(
    setup: Setup.ufurSwapTwistUF,
    adjust: Setup.twoTwoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoTwoCycleHperm',
  ),
  twoTwoCycleFlipHperm(
    setup: Setup.ufurSwapSetup,
    adjust: Setup.twoTwoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoTwoCycleFlipHperm',
  ),
  twoTwoCycleDotHperm(
    setup: Setup.ufurSwapTwistUR,
    adjust: Setup.twoTwoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoTwoCycleDotHperm',
  ),
  twoTwoCycleZperm(
    setup: Setup.ufFlipSetup,
    adjust: Setup.twoTwoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoTwoCycleZperm',
  ),
  twoTwoCycleFlipZperm(
    setup: Setup.noFlipSetup,
    adjust: Setup.twoTwoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoTwoCycleFlipZperm',
  ),
  twoTwoCycleDotZperm(
    setup: Setup.urFlipSetup,
    adjust: Setup.twoTwoCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'twoTwoCycleDotZPerm',
  ),

  /// FOUR CYCLES
  fourCycleTwoSplitPairsSymmetricRight(
    setup: Setup.noFlipSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleTwoSplitPairsSymmetricRight',
  ),
  fourCycleTwoSplitPairsSymmetricLeft(
    setup: Setup.fourFlipSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleTwoSplitPairsSymmetricLeft',
  ),
  fourCycleSymmetricSmallPairs(
    setup: Setup.fInverseSexiSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleSymmetricSmallPairs',
  ),
  fourCycleSymmetricBigPairs(
    setup: Setup.rUFUSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleSymmetricBigPairs',
  ),
  fourCycleSymmetricFlippedPairs(
    setup: Setup.suneSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleSymmetricFlippedPairs',
  ),
  fourCycleDiagonalSmallPairs(
    setup: Setup.ulurSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleDiagonalSmallPairs',
  ),
  fourCycleDiagonalSmallLong(
    setup: Setup.ufurFlipSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleDiagonalSmallLong',
  ),
  fourCycleDiagonalSmallLongFlipped(
    setup: Setup.rotationFsexiSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleDiagonalSmallLongFlipped',
  ),
  fourCycleSmallLeftLine(
    setup: Setup.urFlipSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleSmallLeftLine',
  ),
  fourCycleSmallRightLine(
    setup: Setup.ufurulSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleSmallRightLine',
  ),
  fourCycleBigPairLeftLine(
    setup: Setup.ufurubFlipSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleBigPairLeftLine',
  ),
  fourCycleBigPairRightLine(
    setup: Setup.ufFlipSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleBigPairRightLine',
  ),
  fourCycleAdjacentSmallPairs(
    setup: Setup.urubswapulflipSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleAdjacentSmallPairs',
  ),
  fourCycleAdjacentBigPairs(
    setup: Setup.ufulTwistSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleAdjacentBigPairs',
  ),
  fourCycleHydraulische(
    setup: Setup.ufulSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleHydraulische',
  ),
  fourCycleOppositeBigPairs(
    setup: Setup.ufubFlipSetup,
    adjust: Setup.fourCycleSetup,
    trigger: Setup.fiveMoveTrigger,
    json: 'fourCycleOppositeBigPairs',
  ),
  ;

  const RevengeCase({
    required this.setup,
    required this.trigger,
    required this.adjust,
    required this.json,
  });

  final SetupMixin trigger;
  final SetupMixin adjust;
  final SetupMixin setup;
  final String json;

  static RevengeCase? fromJson(String? json) {
    return RevengeCase.values.firstWhereOrNull((element) => element.json == json);
  }

  static List<RevengeCase> get twoCycleCases => [
        twoCycleOppositeOriented,
        twoCycleOppositeFlipped,
        twoCycleAdjacentOriented,
        twoCycleAdjacentFlipped,
        twoCyclesFLSlotOriented,
        twoCyclesFLSlotFlipped,
        twoCyclesFRSlotOriented,
        twoCyclesFRSlotFlipped,
      ];

  static List<RevengeCase> get topLayer3cycles => [
        threeCycleBackGood,
        threeCycleFlippedJPerm,
        threeCycleUperm,
        threeCycleBackBad,
        threeCycleJperm,
        threeCycleFrontGood,
        threeCycleFrontBad,
        threeCycleFlippedUPerm,
      ];

  static List<RevengeCase> get frSlot3cycles => [
        frSlot3_rightySplit,
        frSlot3_leftyLine,
        frSlot3_smallBlockLeft,
        frSlot3_rightyFlipousUp,
        frSlot3_bigBlockRight,
        frSlot3_leftyFlipousUp,
        frSlot3_leftySplit
      ];

  static List<RevengeCase> get twoTwoCycleCases => [
        twoTwoCycleHperm,
        twoTwoCycleFlipHperm,
        twoTwoCycleDotHperm,
        twoTwoCycleZperm,
        twoTwoCycleFlipZperm,
        twoTwoCycleDotZperm,
      ];

  static List<RevengeCase> get topLayer4cycles => [
        fourCycleTwoSplitPairsSymmetricRight,
        fourCycleTwoSplitPairsSymmetricLeft,
        fourCycleSymmetricSmallPairs,
        fourCycleSymmetricBigPairs,
        fourCycleSymmetricFlippedPairs,
        fourCycleDiagonalSmallPairs,
        fourCycleDiagonalSmallLong,
        fourCycleDiagonalSmallLongFlipped,
        fourCycleSmallLeftLine,
        fourCycleSmallRightLine,
        fourCycleBigPairLeftLine,
        fourCycleBigPairRightLine,
        fourCycleAdjacentSmallPairs,
        fourCycleAdjacentBigPairs,
        fourCycleHydraulische,
        fourCycleOppositeBigPairs,
      ];
}
