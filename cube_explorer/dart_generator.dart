import 'dart:io';

const outputFilePath = 'cube_explorer/outputs/four_flip_output.txt';
const outputVariableName = 'fourFlipAlgorithms';

const dartFileName = 'lib/src/domain/algorithms/four_flip_algorithms.g.dart';

void main() async {
  final file = await File(outputFilePath).readAsString();
  final lines = file.split('\n').where((line) => line.trim().isNotEmpty && line.length > 1).toSet().toList().join('\n');

  final dartContent = '''
const _rawInput = \'\'\'
$lines      
      \'\'\';
final List<String> $outputVariableName = _rawInput.split('\\n').where((element) => element.trim().isNotEmpty).toList();   
''';

  await File(dartFileName).writeAsString(dartContent, mode: FileMode.write);
}
