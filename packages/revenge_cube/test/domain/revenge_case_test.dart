import 'package:flutter_test/flutter_test.dart';
import 'package:revenge_cube/revenge_cube.dart';

void main() {
  test('jsons are unique:', () {
    final cases = RevengeCase.values;
    final uniqueCasesMap = <String, RevengeCase>{};
    for (final c in cases) {
      uniqueCasesMap[c.json] = c;
    }
    expect(uniqueCasesMap.keys.length, cases.length, reason: 'jsons are not unique');
  });
}
