import 'package:flutter_test/flutter_test.dart';
import 'package:revenge_cube/src/domain/enums/revenge_move.dart';

void main() {
  group('RevengeMove:', () {
    test('Parse algorithm smoke test:', () {
      final line = 'R U R\' U\' R\' F R2 U\' R\' U\' R U R\' F\' LP DP';
      final act = RevengeMove.parseLine(line);
      expect(act, isNotNull);
      expect(
        act,
        [
          RM.mR,
          RM.mU,
          RM.mRi,
          RM.mUi,
          RM.mRi,
          RM.mF,
          RM.mR2,
          RM.mUi,
          RM.mRi,
          RM.mUi,
          RM.mR,
          RM.mU,
          RM.mRi,
          RM.mFi,
          RM.mLP,
          RM.mDP,
        ],
      );
    });
  });
}
