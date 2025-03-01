import 'dart:io';

import 'package:cube_core/cube_core.dart';
import 'package:revenge_cube/non_ui_mappers.dart';

const sourceFilePath = 'source.txt';
const outputFilePath = 'output.txt';

void main() async {
  final sourceFileAsString = await File(sourceFilePath).readAsString();
  final map = _parseStringSource(sourceFileAsString);

  final output = File(outputFilePath);
  final parsedMapAsString = map.entries.map((e) => '${e.key}\n${e.value.join('\n')}').join('\nEND\n');
  await output.writeAsString(parsedMapAsString);
}

/// will return Map of collections of algorithms per cubeState
Map<String, List<String>> _parseStringSource(String source) {
  final map = <String, List<String>>{};

  final cut = source.split('\n');
  for (final line in cut) {
    final entry = _parseLine(line);
    // test if case response contains any key that i already have
    final existingStateIndex = entry?.indexWhere((e) => map.containsKey(cms.convertToStringForm(e.caseState)));
    if (existingStateIndex != -1 && existingStateIndex != null) {
      final caseFound = cms.convertToStringForm(entry![existingStateIndex].caseState);
      map[caseFound]!.add(entry[existingStateIndex].caseAlg.map((e) => e.toString()).join(' '));
    } else if (entry != null) {
      final newCase = entry[0].caseState;
      map[cms.convertToStringForm(newCase)] = [entry[0].caseAlg.map((e) => e.toString()).join(' ')];
    }
  }

  return map;
}

final praser = CubeStateParser();
final cms = CubeStateMapper();

class CaseResponse {
  final List<RevengeMove> caseAlg;
  final List<List<Sticker?>> caseState;

  CaseResponse(
    this.caseAlg,
    this.caseState,
  );
}

/// will parse line as map entry, so we can connect it to existing algorithms in the database
List<CaseResponse>? _parseLine(String line) {
  // remove () from line
  final parsedLine = line.split('(').first.trim();

  // parse line to CMs
  final alg = RevengeMove.parseLine(parsedLine);
  if (alg == null) return null;

  // ensure algorithm does do something
  const cubeState = CubeStateEntity();

  final forbiddenCubeStates = [
    MoveService().executeAlgorithm(const CubeStateEntity(), []),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.Y]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.Y2]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.Yi]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.U]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.U, CM.Y]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.U, CM.Y2]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.U, CM.Yi]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.U2]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.U2, CM.Y]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.U2, CM.Y2]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.U2, CM.Yi]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.Ui]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.Ui, CM.Y]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.Ui, CM.Y2]),
    MoveService().executeAlgorithm(const CubeStateEntity(), [CM.Ui, CM.Yi]),
  ];

  final result1 = praser.cubeStateFromRevengeAlgorithm(
    RevengeMove.invertAlgorithm(alg),
    [
      'z2',
      'LP',
    ],
  );
  final result2 = praser.cubeStateFromRevengeAlgorithm(
    RevengeMove.invertAlgorithm(alg),
    ['z2', 'LP', 'y2'],
  );
  final result3 = praser.cubeStateFromRevengeAlgorithm(
    RevengeMove.invertAlgorithm(alg),
    ['z2', 'LP', "y'"],
  );
  final result4 = praser.cubeStateFromRevengeAlgorithm(
    RevengeMove.invertAlgorithm(alg),
    ['z2', 'LP', 'y'],
  );

  final results = [result1, result2, result3, result4];
  if (forbiddenCubeStates.any((element) => results.any((e) => element == e))) {
    return null;
  }

  final cmsResult1 = cms.parse(result1, overrideSideColors: true);
  final cmsResult2 = cms.parse(result2, overrideSideColors: true);
  final cmsResult3 = cms.parse(result3, overrideSideColors: true);
  final cmsResult4 = cms.parse(result4, overrideSideColors: true);

  return [
    CaseResponse([...alg], cmsResult1),
    CaseResponse([...alg, RevengeMove.mU2], cmsResult2),
    CaseResponse([...alg, RevengeMove.mU], cmsResult3),
    CaseResponse([...alg, RevengeMove.mUi], cmsResult4),
  ];
}
