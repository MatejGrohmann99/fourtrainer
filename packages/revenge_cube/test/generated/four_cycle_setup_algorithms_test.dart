
import 'package:cube_core/cube_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:revenge_cube/src/generated/four_cycle_setup_algorithms.g.dart';

void main() {
  group(
    'fourCycleSetupAlgorithms:',
        () {
      test(
        'Every generated moves UF->BU, UB->UF, UR-> LU and does not effect DF DR DB DL',
            () {
          final failedTests = <String>[];

          int lineCount = 2;
          for (final algorithm in fourCycleSetupAlgorithms) {
            const cubeState = CubeStateEntity();
            final algorithmParsed = AlgService().getAlgorithmFromString(algorithm);
            final endState = MoveService().executeAlgorithm(cubeState, algorithmParsed);
            try {
              // test UF edge
              final cubeStateUFEdgeTuple = (cubeState.state[0][2][1], cubeState.state[1][0][1]);
              final endStateUBEdgeTuple = (endState.state[0][0][1], endState.state[3][0][1]);
              expect(cubeStateUFEdgeTuple.$1, endStateUBEdgeTuple.$2);
              expect(cubeStateUFEdgeTuple.$2, endStateUBEdgeTuple.$1);

              // test UB edge
              final cubeStateUBEdgeTuple = (cubeState.state[0][0][1], cubeState.state[3][0][1]);
              final endStateUFEdgeTuple = (endState.state[0][2][1], endState.state[1][0][1]);
              expect(cubeStateUBEdgeTuple.$1, endStateUFEdgeTuple.$1);
              expect(cubeStateUBEdgeTuple.$2, endStateUFEdgeTuple.$2);

              // test UR edge
              final cubeStateUREdgeTuple = (cubeState.state[0][1][2], cubeState.state[2][0][1]);
              final endStateULEdgeTuple = (endState.state[0][1][0], endState.state[4][0][1]);
              expect(cubeStateUREdgeTuple.$1, endStateULEdgeTuple.$2);
              expect(cubeStateUREdgeTuple.$2, endStateULEdgeTuple.$1);

              // Verify bottom cross edges wont move
              expect(cubeState.state[5][0][1], endState.state[5][0][1]);
              expect(cubeState.state[1][2][1], endState.state[1][2][1]);
              expect(cubeState.state[5][1][0], endState.state[5][1][0]);
              expect(cubeState.state[5][1][2], endState.state[5][1][2]);
              expect(cubeState.state[2][2][1], endState.state[2][2][1]);
              expect(cubeState.state[3][2][1], endState.state[3][2][1]);
              expect(cubeState.state[5][2][1], endState.state[5][2][1]);
              expect(cubeState.state[4][2][1], endState.state[4][2][1]);
            } catch (e) {
              failedTests.add('''
Algorithm behaviour test failed: 

file:         package:fourtrainer/src/domain/algorithms/four_cycle_setup_algorithms.g.dart $lineCount:0
algorithm:    $algorithm
$e
''');
            }
            lineCount++;
          }
          if (failedTests.isNotEmpty) {
            failedTests.insert(
              0,
              'ubFlipAlgorithms test failed ${failedTests.length} times out of ${fourCycleSetupAlgorithms.length} tests',
            );
            throw failedTests.join('\n');
          }
        },
      );
    },
  );
}
