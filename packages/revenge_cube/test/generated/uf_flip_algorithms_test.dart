import 'package:cube_core/cube_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:revenge_cube/src/generated/uf_flip_algorithms.g.dart';

void main() {
  group(
    'ufFlipAlgorithms:',
    () {
      test(
        'Every generated algorithm does flips UF edges and does not effect UB UR DF DR DB DL',
        () {
          final failedTests = <String>[];

          int lineCount = 2;
          for (final algorithm in ufFlipAlgorithms) {
            const cubeState = CubeStateEntity();
            final algorithmParsed = AlgService().getAlgorithmFromString(algorithm);
            final endState = MoveService().executeAlgorithm(cubeState, algorithmParsed);
            try {
              // test UF edge
              final cubeStateUFEdgeTuple = (cubeState.state[0][2][1], cubeState.state[1][0][1]);
              final endStateUFEdgeTuple = (endState.state[0][2][1], endState.state[1][0][1]);
              expect(cubeStateUFEdgeTuple.$1, endStateUFEdgeTuple.$2);
              expect(cubeStateUFEdgeTuple.$2, endStateUFEdgeTuple.$1);

              // test UB edge
              final cubeStateUBEdgeTuple = (cubeState.state[0][0][1], cubeState.state[3][0][1]);
              final endStateUBEdgeTuple = (endState.state[0][0][1], endState.state[3][0][1]);
              expect(cubeStateUBEdgeTuple, endStateUBEdgeTuple);

              // test UR edge
              final cubeStateUREdgeTuple = (cubeState.state[0][1][2], cubeState.state[2][0][1]);
              final endStateUREdgeTuple = (endState.state[0][1][2], endState.state[2][0][1]);
              expect(cubeStateUREdgeTuple, endStateUREdgeTuple);

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

file:         package:fourtrainer/src/domain/algorithms/uf_flip_algorithms.g.dart $lineCount:0
algorithm:    $algorithm
$e
''');
            }
            lineCount++;
          }
          if (failedTests.isNotEmpty) {
            failedTests.insert(
              0,
              'ufFlipAlgorithms test failed ${failedTests.length} times out of ${ufFlipAlgorithms.length} tests',
            );
            throw failedTests.join('\n');
          }
        },
      );
    },
  );
}
