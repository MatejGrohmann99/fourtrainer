import 'dart:io';

const filePath = 'cube_explorer/algorithms/four_flip_algorithm.txt';
const outputPath = 'cube_explorer/outputs/four_flip_output.txt';

const minLength = 10;
const maxLength = 10;

const maxDoubleTurns = 4;

void main() async {
  final file = await File(filePath).readAsString();

  final lines = file
      .split('\n')
      .map(
        (line) => parseLine(
          line,
          maxLength,
          minLength,
        ),
      )
      .nonNulls
      .toList();

  final output = File(outputPath);
  output.writeAsStringSync(lines.join('\n'), mode: FileMode.write);

  print('Done, generated to path: $outputPath');
}

String? parseLine(String line, int maxLength, int minLength) {
  final parts = line
      .replaceAll('\n', '')
      .split(' ')
      .where((part) {
        if (part.contains('(')) return false;
        return part.isNotEmpty;
      })
      .nonNulls
      .toList();
  if (parts.length < minLength || parts.length > maxLength) return null;

  if (parts.where((part) => part.contains('2')).length > maxDoubleTurns) return null;

  return parts.join(' ');
}
