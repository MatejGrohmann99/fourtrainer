import 'package:revenge_cube/src/domain/enums/revenge_case.dart';

extension AlgorithmMapper on RevengeCase {
  String get alg {
    return switch (this) {
      /// THREE CYCLES
      RevengeCase.threeCycleBackGood => "Rw U R' U' r'",
      RevengeCase.threeCycleFlippedJPerm => "R U' R' U R' Rw U R U' Rw'",
      RevengeCase.threeCycleUperm => "U' Rw U Rw' U Rw' U' Rw2 U' Rw' U Rw' U Rw",
      RevengeCase.threeCycleBackBad => "Lw' R U R' U' Lw",
      RevengeCase.threeCycleJperm => "Rw U2 Rw' U Rw U2 Rw' U2 Rw U' Rw'",
      RevengeCase.threeCycleFrontGood => "Rw' U' R U r",
      RevengeCase.threeCycleFrontBad => "Lw R' U' R U Lw'",
      RevengeCase.threeCycleFlippedUPerm => "R U' R' U Rw' F R F' r",

      /// FOUR CYCLES
      RevengeCase.fourCycleTwoSplitPairsSymmetricRight => "",
      RevengeCase.fourCycleTwoSplitPairsSymmetricLeft => "",
      _ => "",
    };
  }
}
