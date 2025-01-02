import 'dart:io';

void main() async {
  final outputFile = File('test${Platform.pathSeparator}coverage_test.dart');

  final dir = Directory('lib${Platform.pathSeparator}');
  final files = dir.listSync(recursive: true, followLinks: false).whereType<File>().map((e) {
    return "import 'package:fourtrainer/${e.path.replaceAll(r'\', '/').replaceAll('lib/', '')}';";
  }).toList();
  files.sort();

  await outputFile.writeAsString(
    '''
// ignore_for_file: unused_import, directives_ordering
${files.join('\n')}

void main() {}
  ''',
    mode: FileMode.write,
  );
}
