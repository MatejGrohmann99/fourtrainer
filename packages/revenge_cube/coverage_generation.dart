import 'dart:io';

void main() async {
  final outputFile = File(
      'packages${Platform.pathSeparator}revenge_cube${Platform.pathSeparator}test${Platform.pathSeparator}coverage_test.dart');

  final dir =
      Directory('packages${Platform.pathSeparator}revenge_cube${Platform.pathSeparator}lib${Platform.pathSeparator}');
  final files = dir.listSync(recursive: true, followLinks: false).whereType<File>().map((e) {
    return "import 'package:revenge_cube/${e.path.replaceAll(r'\', '/').replaceAll('packages/revenge_cube/lib/', '')}';";
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
