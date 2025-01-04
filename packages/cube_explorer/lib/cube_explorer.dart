import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotations.dart';

import 'package:analyzer/dart/element/element.dart';

Builder cubeExplorerBuilder(BuilderOptions options) => SharedPartBuilder([CubeExplorerGenerator()], 'simple_generator');

class CubeExplorerGenerator extends GeneratorForAnnotation<CubeExplorerAnnotation> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    (String, int) parseAlgorithms(String algorithms) {
      final lines = algorithms.split('\n');
      final parsedLines = lines
          .map(
            (line) => parseLine(
              line,
              annotation.read('maxAlgorithmLength').intValue,
              annotation.read('minAlgorithmLength').intValue,
              annotation.read('maxNumberOfDoubleTurns').intValue,
            ),
          )
          .nonNulls
          .toList();
      return (parsedLines.join(','), parsedLines.length);
    }

    final algorithms = annotation.read('algorithms').listValue;
    final algorithmsParsed = algorithms
        .map((e) {
          final record = e.toRecordValue();
          if (record != null) {
            final positionalArguments = record.positional.map((e) => e.toStringValue()).nonNulls.toList();
            return (positionalArguments.first, positionalArguments.last);
          }
          return null;
        })
        .nonNulls
        .toList();

    final cubeExplorerAlgs = algorithmsParsed.map(
      (e) {
        final algorithms = parseAlgorithms(e.$2);
        return '''
    int get ${e.$1}Length => ${algorithms.$2};
    List<String> get ${e.$1} => [${algorithms.$1}];
    ''';
      },
    ).join('\n');

    return '''
     // Auto-generated code
    extension ${element.name}Extension on ${element.name} {
     $cubeExplorerAlgs
    }
    ''';
  }
}

String? parseLine(String line, int maxLength, int minLength, int maxDoubleTurns) {
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

  return '"${parts.join(' ')}"';
}
