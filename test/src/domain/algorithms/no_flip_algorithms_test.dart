import 'package:cube_core/cube_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fourtrainer/src/domain/algorithms/no_top_flip_algorithms.g.dart';

void main() {
  group(
    'NoFlipAlgorithms:',
    () {
      test(
        'Every generated algorithm does not effect UB UR UL UF DF DR DB DL',
        () {
          final failedTests = <String>[];

          int lineCount = 2;
          for (final algorithm in noTopFlipAlgorithm) {
            const cubeState = CubeStateEntity();
            final algorithmParsed = AlgService().getAlgorithmFromString(algorithm);
            final endState = MoveService().executeAlgorithm(cubeState, algorithmParsed);
            try {
              expect(cubeState.state[0][0][1], endState.state[0][0][1]);
              expect(cubeState.state[0][1][0], endState.state[0][1][0]);
              expect(cubeState.state[0][1][2], endState.state[0][1][2]);
              expect(cubeState.state[0][2][1], endState.state[0][2][1]);

              expect(cubeState.state[1][0][1], endState.state[1][0][1]);
              expect(cubeState.state[2][0][1], endState.state[2][0][1]);
              expect(cubeState.state[3][0][1], endState.state[3][0][1]);
              expect(cubeState.state[4][0][1], endState.state[4][0][1]);


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

file:         package:fourtrainer/src/domain/algorithms/no_top_flip_algorithms.g.dart $lineCount:0
algorithm:    $algorithm
$e
''');
            }
            lineCount++;
          }
          if (failedTests.isNotEmpty) {
            failedTests.insert(
              0,
              'noTopFlipAlgorithm test failed ${failedTests.length} times out of ${noTopFlipAlgorithm.length} tests',
            );
            throw failedTests.join('\n');
          }
        },
      );
    },
  );
}
