import 'package:revenge_cube/src/domain/enums/revenge_case.dart';

extension CaseDescriptionMapper on RevengeCase {
  String get displayName {
    switch (this) {
      case RevengeCase.threeCycleBackGood:
        return '3-Cycle / Back Good';
      case RevengeCase.threeCycleFlippedJPerm:
        return '3-Cycle / Flipped J perm';
      case RevengeCase.threeCycleUperm:
        return '3-Cycle / U perm';
      case RevengeCase.threeCycleBackBad:
        return '3-Cycle / Back Bad';
      case RevengeCase.threeCycleJperm:
        return '3-Cycle / J Perm';
      case RevengeCase.threeCycleFrontGood:
        return '3-Cycle / Front Good';
      case RevengeCase.threeCycleFrontBad:
        return '3-Cycle / Front Bad';
      case RevengeCase.threeCycleFlippedUPerm:
        return '3-Cycle / flipped U perm';
      case RevengeCase.fourCycleTwoSplitPairsSymmetricRight:
        return '4-Cycle / Two Split Pairs Symmetric Right';
      case RevengeCase.fourCycleTwoSplitPairsSymmetricLeft:
        return '4-Cycle / Two Split Pairs Symmetric Left';
      default:
        return name;
    }
  }
}
