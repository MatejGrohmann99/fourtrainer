import 'package:cube_core/cube_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:revenge_cube/src/algorithms/better/better_setup.dart';
import 'package:revenge_cube/src/algorithms/revenge_algorithms.dart';

void main() {
  group(
    'Algorithms functionality smoke test:',
    () {
      test(
        'Verify algorithm does what suppose to',
        () {
          final failedTests = <String>[];

          final algorithms = BetterSetup().UFUBFRNoSwapAlgorithm;
          int lineCount = 2;
          for (final algorithm in algorithms) {
            const cubeState = CubeStateEntity();
            final algorithmParsed = AlgService().getAlgorithmFromString(algorithm);
            final endState = MoveService().executeAlgorithm(cubeState, algorithmParsed);
            try {
              /// verify UF wont move
              expect(cubeState.state[0][2][1], endState.state[0][2][1]);
              expect(cubeState.state[3][0][1], endState.state[3][0][1]);

              /// verify UB wont move
              expect(cubeState.state[1][0][1], endState.state[1][0][1]);
              expect(cubeState.state[0][0][1], endState.state[0][0][1]);

              /// verify FR wont move
              expect(cubeState.state[1][1][2], endState.state[1][1][2]);
              expect(cubeState.state[2][1][0], endState.state[2][1][0]);

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
algorithm:    $algorithm
$e
''');
            }
            lineCount++;
          }
          if (failedTests.isNotEmpty) {
            failedTests.insert(
              0,
              'test failed ${failedTests.length} times out of ${algorithms.length} tests',
            );
            throw failedTests.join('\n');
          }
        },
      );
    },
  );
}
