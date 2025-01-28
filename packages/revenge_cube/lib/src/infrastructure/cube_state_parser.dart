import 'package:cube_core/cube_core.dart';

import '../../revenge_cube.dart';

class CubeStateParser {
  final algService = AlgService();
  final moveService = MoveService();

  CubeStateEntity cubeStateFromRevengeAlgorithm(List<RevengeMove> alg, String? premove) {
    var cubeState = CubeStateEntity();
    final premoveAlg = algService.getAlgorithmFromString(premove ?? '');
    cubeState = moveService.executeAlgorithm(cubeState, premoveAlg);

    for (final move in alg) {
      if (move.value case final value?) {
        final parsedMove = algService.getAlgorithmFromString(value);
        cubeState = moveService.executeAlgorithm(cubeState, parsedMove);
      } else {
        if (move == RM.mLP) {
          // Lucas parity
          final cs = cubeState.state;
          final copy = List.generate(6, (i) => List.generate(3, (j) => List.generate(3, (k) => cs[i][j][k])));

          // UFL corner swap
          copy[0][2][0] = cs[1][0][2];
          copy[1][0][0] = cs[0][2][2];
          copy[4][0][2] = cs[2][0][0];

          // UFR corner swap
          copy[0][2][2] = cs[1][0][0];
          copy[1][0][2] = cs[0][2][0];
          copy[2][0][0] = cs[4][0][2];

          // UL edge Swap
          copy[0][1][0] = cs[0][1][2];
          copy[4][0][1] = cs[2][0][1];

          // UR edge Swap
          copy[0][1][2] = cs[0][1][0];
          copy[2][0][1] = cs[4][0][1];

          // UF Edge twist
          copy[0][2][1] = cs[1][0][1];
          copy[1][0][1] = cs[0][2][1];

          cubeState = cubeState.copyWith(state: copy);

        } else if (move == RM.mDP) {
          // Drew parity without auf
          final cs = cubeState.state;
          final copy = List.generate(6, (i) => List.generate(3, (j) => List.generate(3, (k) => cs[i][j][k])));

          // UFL corner swap
          copy[0][2][0] = cs[1][0][2];
          copy[1][0][0] = cs[0][2][2];
          copy[4][0][2] = cs[2][0][0];

          // UFR corner swap
          copy[0][2][2] = cs[1][0][0];
          copy[1][0][2] = cs[0][2][0];
          copy[2][0][0] = cs[4][0][2];

          // UF Edge twist
          copy[0][2][1] = cs[1][0][1];
          copy[1][0][1] = cs[0][2][1];

          final cubeStateNow = cubeState.copyWith(state: copy);
          final result = moveService.executeAlgorithm(cubeStateNow, algService.getAlgorithmFromString('U2'));
          cubeState = result;
        }
      }
    }

    return cubeState;
  }
}
