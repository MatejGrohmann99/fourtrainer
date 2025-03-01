import 'package:revenge_cube/non_ui_mappers.dart';
import 'package:revenge_cube/revenge_cube.dart';

part 'll_alg_filter.raw.dart';

part 'll_alg_filter.rawruf.dart';

final cms = CubeStateMapper();

Map<List<List<Sticker?>>, List<List<RevengeMove>>> getAlgsFromRawInput() {
  final rawSplit = _raw.split('\nEND\n');
  final map = <List<List<Sticker?>>, List<List<RevengeMove>>>{};

  for (final part in rawSplit) {
    final lines = part.split('\n');
    final lineStickerCase = cms.convertFromStringForm(lines.first);
    final lineAlg = lines.sublist(1).map((e) => RevengeMove.parseLine(e)).nonNulls.toList();
    lineAlg.sort((a, b) => a.length.compareTo(b.length));
    map[lineStickerCase] = lineAlg;
  }
  return map;
}

Map<List<List<Sticker?>>, List<List<RevengeMove>>> getAlgsFromRawInputRuf() {
  final rawSplit = _rawruf.split('\nEND\n');
  final map = <List<List<Sticker?>>, List<List<RevengeMove>>>{};

  for (final part in rawSplit) {
    final lines = part.split('\n');
    final lineStickerCase = cms.convertFromStringForm(lines.first);
    final lineAlg = lines.sublist(1).map((e) => RevengeMove.parseLine(e)).nonNulls.toList();
    lineAlg.sort((a, b) => a.length.compareTo(b.length));
    map[lineStickerCase] = lineAlg;
  }
  return map;
}
