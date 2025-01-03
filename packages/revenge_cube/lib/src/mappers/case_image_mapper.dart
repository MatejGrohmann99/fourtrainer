import '../domain/enums/revenge_case.dart';
import '../domain/enums/sticker.dart';

extension CaseImageMapper on RevengeCase {
  Map<(int, int), S> get ui {
    switch (this) {
      case RevengeCase.threeCycleBackGood:
        return {
          // TOP EDGE
          (0, 2): S.b,
          (0, 3): S.g,
          (1, 2): S.y,
          (1, 3): S.o,
          // BOTTOM EDGE
          (5, 2): S.y,
          (5, 3): S.y,
          (4, 2): S.r,
          (4, 3): S.b,
          // SIDE EDGE
          (2, 5): S.g,
          (3, 5): S.r,
          (2, 4): S.o,
          (3, 4): S.y,
        };
      case RevengeCase.threeCycleFlippedJPerm:
        return {
          // TOP EDGE
          (0, 2): S.o,
          (0, 3): S.g,
          (1, 2): S.y,
          (1, 3): S.y,
          // BOTTOM EDGE
          (5, 2): S.r,
          (5, 3): S.g,
          (4, 2): S.y,
          (4, 3): S.y,
          // SIDE EDGE

          (2, 4): S.o,
          (3, 4): S.r,
          (2, 5): S.y,
          (3, 5): S.y,
        };
      case RevengeCase.threeCycleUperm:
        return {
          // TOP EDGE
          (0, 2): S.g,
          (0, 3): S.o,
          (1, 2): S.y,
          (1, 3): S.y,
          // BOTTOM EDGE
          (5, 2): S.g,
          (5, 3): S.r,
          (4, 2): S.y,
          (4, 3): S.y,
          // SIDE EDGE

          (2, 5): S.r,
          (3, 5): S.o,
          (2, 4): S.y,
          (3, 4): S.y,
        };
      case RevengeCase.threeCycleBackBad:
        return {
          // TOP EDGE
          (0, 2): S.r,
          (0, 3): S.g,
          (1, 2): S.y,
          (1, 3): S.o,
          // BOTTOM EDGE
          (5, 2): S.o,
          (5, 3): S.g,
          (4, 2): S.g,
          (4, 3): S.r,
          // SIDE EDGE

          (2, 4): S.g,
          (3, 4): S.r,
          (2, 5): S.r,
          (3, 5): S.y,
        };
      case RevengeCase.threeCycleJperm:
        return {
          // TOP EDGE
          (0, 2): S.r,
          (0, 3): S.g,
          (1, 2): S.y,
          (1, 3): S.o,
          // BOTTOM EDGE
          (5, 2): S.r,
          (5, 3): S.g,
          (4, 2): S.g,
          (4, 3): S.o,
          // SIDE EDGE
          (2, 4): S.g,
          (3, 4): S.y,
          (2, 5): S.r,
          (3, 5): S.r,
        };
      case RevengeCase.threeCycleFrontGood:
        return {
          // TOP EDGE
          (0, 2): S.r,
          (0, 3): S.g,
          (1, 2): S.y,
          (1, 3): S.o,
          // BOTTOM EDGE
          (5, 2): S.o,
          (5, 3): S.g,
          (4, 2): S.g,
          (4, 3): S.r,
          // SIDE EDGE
          (2, 4): S.r,
          (3, 4): S.r,
          (2, 5): S.y,
          (3, 5): S.g,
        };
      case RevengeCase.threeCycleFrontBad:
        return {
          // TOP EDGE
          (0, 2): S.b,
          (0, 3): S.g,
          (1, 2): S.y,
          (1, 3): S.o,
          // BOTTOM EDGE
          (5, 2): S.y,
          (5, 3): S.y,
          (4, 2): S.r,
          (4, 3): S.b,
          // SIDE EDGE
          (2, 5): S.y,
          (3, 5): S.o,
          (2, 4): S.r,
          (3, 4): S.g,
        };
      case RevengeCase.threeCycleFlippedUPerm:
        return {
          // TOP EDGE
          (0, 2): S.g,
          (0, 3): S.r,
          (1, 2): S.o,
          (1, 3): S.b,
          // BOTTOM EDGE
          (5, 2): S.g,
          (5, 3): S.r,
          (4, 2): S.o,
          (4, 3): S.y,
          // SIDE EDGE
          (2, 5): S.y,
          (3, 5): S.b,
          (2, 4): S.r,
          (3, 4): S.r,
        };
      case RevengeCase.fourCycleTwoSplitPairsSymmetricRight:
        return {
          // TOP EDGE
          (0, 2): S.y,
          (0, 3): S.b,
          (1, 2): S.o,
          (1, 3): S.r,
          // BOTTOM EDGE
          (5, 2): S.b,
          (5, 3): S.o,
          (4, 2): S.o,
          (4, 3): S.y,
          // SIDE EDGE
          (2, 5): S.r,
          (3, 5): S.r,
          (2, 4): S.y,
          (3, 4): S.b,
          // SIDE EDGE LEFTOUS
          (2, 0): S.o,
          (3, 0): S.y,
          (2, 1): S.b,
          (3, 1): S.r,
        };
      case RevengeCase.fourCycleTwoSplitPairsSymmetricLeft:
        return {
          // TOP EDGE
          (0, 2): S.b,
          (0, 3): S.r,
          (1, 2): S.o,
          (1, 3): S.y,
          // BOTTOM EDGE
          (5, 2): S.y,
          (5, 3): S.b,
          (4, 2): S.r,
          (4, 3): S.r,
          // SIDE EDGE
          (2, 5): S.r,
          (3, 5): S.o,
          (2, 4): S.b,
          (3, 4): S.y,
          // SIDE EDGE LEFTOUS
          (2, 0): S.y,
          (3, 0): S.o,
          (2, 1): S.o,
          (3, 1): S.b,
        };
    }
  }
}
