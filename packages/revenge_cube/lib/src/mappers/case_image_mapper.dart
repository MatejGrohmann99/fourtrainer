import '../domain/enums/revenge_case.dart';
import '../domain/enums/sticker.dart';
import '../presentation/revenge_case_image_parser.dart';

extension CaseImageMapper on RevengeCase {
  RevengeCaseImageReference get ui {
    switch (this) {
      case RevengeCase.threeCycleBackGood:
        return RevengeCaseImageReference(
          ub: (S.b, S.g, S.y, S.o),
          uf: (S.y, S.y, S.r, S.b),
          ur: (S.g, S.r, S.o, S.y),
        );
      case RevengeCase.threeCycleFlippedJPerm:
        return RevengeCaseImageReference(
          ub: (S.o, S.g, S.y, S.y),
          uf: (S.r, S.g, S.y, S.y),
          ur: (S.o, S.r, S.y, S.y),
        );
      case RevengeCase.threeCycleUperm:
        return RevengeCaseImageReference(
          ub: (S.g, S.o, S.y, S.y),
          uf: (S.g, S.r, S.y, S.y),
          ur: (S.o, S.r, S.y, S.y),
        );

      case RevengeCase.threeCycleBackBad:
        return RevengeCaseImageReference(
          ub: (S.r, S.g, S.y, S.o),
          uf: (S.o, S.g, S.g, S.r),
          ur: (S.g, S.r, S.r, S.y),
        );
      case RevengeCase.threeCycleJperm:
        return RevengeCaseImageReference(
          ub: (S.r, S.g, S.y, S.o),
          uf: (S.r, S.g, S.g, S.o),
          ur: (S.r, S.r, S.g, S.y),
        );
      case RevengeCase.threeCycleFrontGood:
        return RevengeCaseImageReference(
          ub: (S.r, S.g, S.y, S.o),
          uf: (S.o, S.g, S.g, S.r),
          ur: (S.y, S.g, S.r, S.r),
        );
      case RevengeCase.threeCycleFrontBad:
        return RevengeCaseImageReference(
          ub: (S.b, S.b, S.y, S.o),
          uf: (S.y, S.y, S.r, S.b),
          ur: (S.y, S.o, S.r, S.g),
        );
      case RevengeCase.threeCycleFlippedUPerm:
        return RevengeCaseImageReference(
          ub: (S.g, S.r, S.o, S.b),
          uf: (S.g, S.r, S.o, S.y),
          ur: (S.y, S.b, S.r, S.r),
        );
      case RevengeCase.fourCycleTwoSplitPairsSymmetricRight:
        return RevengeCaseImageReference(
          ub: (S.y, S.b, S.o, S.r),
          uf: (S.b, S.o, S.o, S.y),
          ur: (S.r, S.r, S.y, S.b),
          ul: (S.o, S.y, S.b, S.r),
        );
      case RevengeCase.fourCycleTwoSplitPairsSymmetricLeft:
        return RevengeCaseImageReference(
          ub: (S.b, S.r, S.o, S.y),
          uf: (S.y, S.b, S.r, S.r),
          ur: (S.r, S.o, S.b, S.y),
          ul: (S.y, S.o, S.o, S.b),
        );
      case RevengeCase.fourCycleSymmetricSmallPairs:
        return RevengeCaseImageReference(
          ub: (S.g, S.o, S.r, S.y),
          uf: (S.r, S.r, S.y, S.b),
          ul: (S.g, S.r, S.r, S.y),
          ur: (S.o, S.r, S.y, S.b),
        );
      case RevengeCase.fourCycleSymmetricBigPairs:
        return RevengeCaseImageReference(
          ub: (S.g, S.r, S.y, S.y),
          uf: (S.y, S.g, S.b, S.r),
          ul: (S.g, S.r, S.r, S.y),
          ur: (S.y, S.g, S.b, S.y),
        );
      case RevengeCase.fourCycleSymmetricFlippedPairs:
        return RevengeCaseImageReference(
          uf: (S.o, S.r, S.g, S.g),
          ul: (S.y, S.g, S.o, S.r),
          ur: (S.b, S.g, S.y, S.o),
          ub: (S.y, S.o, S.b, S.y),
        );
      case RevengeCase.fourCycleDiagonalSmallPairs:
        return RevengeCaseImageReference(
          uf: (S.r, S.b, S.y, S.y),
          ur: (S.b, S.b, S.o, S.y),
          ul: (S.y, S.o, S.o, S.b),
          ub: (S.y, S.y, S.o, S.r),
        );
      case RevengeCase.fourCycleDiagonalSmallLong:
        return RevengeCaseImageReference(
          uf: (S.g, S.g, S.o, S.y),
          ul: (S.b, S.y, S.r, S.o),
          ur: (S.b, S.g, S.r, S.y),
          ub: (S.g, S.y, S.o, S.o),
        );
      case RevengeCase.fourCycleDiagonalSmallLongFlipped:
        return RevengeCaseImageReference(
          uf: (S.b, S.b, S.y, S.r),
          ul: (S.y, S.o, S.b, S.g),
          ur: (S.y, S.b, S.o, S.r),
          ub: (S.o, S.o, S.y, S.g),
        );
      case RevengeCase.fourCycleSmallLeftLine:
        return RevengeCaseImageReference(
          uf: (S.y, S.g, S.b, S.y),
          ul: (S.y, S.r, S.r, S.g),
          ub: (S.y, S.r, S.b, S.y),
          ur: (S.g, S.g, S.r, S.y),
        );
      case RevengeCase.fourCycleSmallRightLine:
        return RevengeCaseImageReference(
          ub: (S.y, S.o, S.o, S.b),
          ul: (S.y, S.o, S.r, S.y),
          uf: (S.b, S.r, S.o, S.b),
          ur: (S.y, S.r, S.r, S.b),
        );
      case RevengeCase.fourCycleBigPairLeftLine:
        return RevengeCaseImageReference(
          uf: (S.b, S.o, S.r, S.y),
          ul: (S.y, S.b, S.r, S.o),
          ur: (S.b, S.r, S.r, S.y),
          ub: (S.o, S.o, S.b, S.y),
        );
      case RevengeCase.fourCycleBigPairRightLine:
        return RevengeCaseImageReference(
          uf: (S.o, S.b, S.y, S.r),
          ul: (S.g, S.r, S.y, S.y),
          ub: (S.r, S.y, S.b, S.g),
          ur: (S.o, S.r, S.y, S.y),
        );
      case RevengeCase.fourCycleAdjacentSmallPairs:
        return RevengeCaseImageReference(
            uf: (S.o, S.y, S.b, S.r), ul: (S.r, S.o, S.b, S.b), ub: (S.y, S.b, S.o, S.r), ur: (S.o, S.y, S.y, S.r));
      case RevengeCase.fourCycleAdjacentBigPairs:
        return RevengeCaseImageReference(
          uf: (S.r, S.b, S.g, S.y),
          ul: (S.b, S.b, S.y, S.o),
          ub: (S.o, S.b, S.b, S.r),
          ur: (S.r, S.r, S.g, S.b),
        );
      case RevengeCase.fourCycleHydraulische:
        return RevengeCaseImageReference(
          uf: (S.o, S.o, S.y, S.b),
          ul: (S.r, S.b, S.g, S.o),
          ub: (S.o, S.o, S.y, S.g),
          ur: (S.r, S.g, S.g, S.o),
        );
      case RevengeCase.fourCycleOppositeBigPairs:
        return RevengeCaseImageReference(
          uf: (S.o, S.b, S.y, S.o),
          ur: (
            S.g,
            S.y,
            S.o,
            S.r,
          ),
          ul: (S.b, S.o, S.o, S.g),
          ub: (S.y, S.y, S.r, S.o),
        );
      case RevengeCase.twoCycleAdjacentFlipped:
        return RevengeCaseImageReference(
          uf: (S.o, S.b, S.y, S.y),
          ur: (S.y, S.y, S.b, S.o),
        );
      case RevengeCase.twoCycleAdjacentOriented:
        return RevengeCaseImageReference(
          uf: (S.b, S.b, S.o, S.r),
          ur: (S.b, S.b, S.o, S.r),
        );
      case RevengeCase.twoCycleOppositeFlipped:
        return RevengeCaseImageReference(
          uf: (S.g, S.b, S.y, S.r),
          ur: (S.g, S.b, S.y, S.r),
        );
      case RevengeCase.twoCycleOppositeOriented:
        return RevengeCaseImageReference(
          uf: (S.y, S.g, S.b, S.y),
          ur: (S.y, S.b, S.g, S.y),
        );
      case RevengeCase.twoCyclesFLSlotFlipped:
        return RevengeCaseImageReference(
          uf: (S.b, S.o, S.y, S.y),
          fl: (S.o, S.b, S.y, S.y),
        );
      case RevengeCase.twoCyclesFLSlotOriented:
        return RevengeCaseImageReference(
          uf: (S.o, S.y, S.g, S.g),
          fl: (S.g, S.g, S.o, S.y),
        );
      case RevengeCase.twoCyclesFRSlotFlipped:
        return RevengeCaseImageReference(
          uf: (S.o, S.y, S.g, S.g),
          fr: (S.g, S.g, S.o, S.y),
        );
      case RevengeCase.twoCyclesFRSlotOriented:
        return RevengeCaseImageReference(
          uf: (S.y, S.o, S.o, S.g),
          fr: (S.g, S.o, S.o, S.y),
        );
      case RevengeCase.twoTwoCycleHperm:
        return RevengeCaseImageReference(
          ub: (S.o, S.g, S.b, S.r),
          uf: (S.o, S.g, S.b, S.r),
          ul: (S.g, S.g, S.y, S.o),
          ur: (S.g, S.g, S.y, S.o),
        );
      case RevengeCase.twoTwoCycleFlipHperm:
        return RevengeCaseImageReference(
          ub: (S.y, S.g, S.g, S.r),
          uf: (S.r, S.g, S.g, S.y),
          ul: (S.r, S.o, S.b, S.b),
          ur: (S.r, S.o, S.b, S.b),
        );
      case RevengeCase.twoTwoCycleDotHperm:
        return RevengeCaseImageReference(
          ub: (S.y, S.y, S.r, S.g),
          uf: (S.g, S.r, S.y, S.y),
          ul: (S.o, S.o, S.y, S.g),
          ur: (S.g, S.y, S.o, S.o),
        );
      case RevengeCase.twoTwoCycleZperm:
        return RevengeCaseImageReference(
          ub: (S.o, S.y, S.y, S.r),
          uf: (S.g, S.b, S.o, S.r),
          ul: (S.o, S.y, S.y, S.r),
          ur: (S.g, S.b, S.o, S.r),
        );
      case RevengeCase.twoTwoCycleFlipZperm:
        return RevengeCaseImageReference(
          ub: (S.r, S.r, S.b, S.y),
          uf: (S.o, S.y, S.g, S.g),
          ul: (S.r, S.r, S.b, S.y),
          ur: (S.g, S.g, S.y, S.o),
        );
      case RevengeCase.twoTwoCycleDotZperm:
        return RevengeCaseImageReference(
          ub: (S.o, S.r, S.b, S.g),
          uf: (S.r, S.b, S.y, S.r),
          ul: (S.g, S.b, S.r, S.o),
          ur: (S.r, S.y, S.b, S.r),
        );
    }
  }
}
