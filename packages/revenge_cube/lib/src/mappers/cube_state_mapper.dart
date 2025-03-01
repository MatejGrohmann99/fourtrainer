import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:cube_core/cube_core.dart';

import '../domain/enums/sticker.dart';

class CubeStateMapper {
  List<List<Sticker?>> parse(CubeStateEntity s, {bool overrideSideColors = false}) {
    final sg = overrideSideColors ? [S.w, null, null, null, null, S.y] : [S.w, S.g, S.r, S.b, S.o, S.y];

    final gridColours = [
      [null, sg[s.state[3][0][2]], sg[s.state[3][0][1]], sg[s.state[3][0][1]], sg[s.state[3][0][0]], null],
      [
        sg[s.state[4][0][0]],
        sg[s.state[0][0][0]],
        sg[s.state[0][0][1]],
        sg[s.state[0][0][1]],
        sg[s.state[0][0][2]],
        sg[s.state[2][0][2]]
      ],
      [
        sg[s.state[4][0][1]],
        sg[s.state[0][1][0]],
        sg[s.state[0][1][1]],
        sg[s.state[0][1][1]],
        sg[s.state[0][1][2]],
        sg[s.state[2][0][1]]
      ],
      [
        sg[s.state[4][0][1]],
        sg[s.state[0][1][0]],
        sg[s.state[0][1][1]],
        sg[s.state[0][1][1]],
        sg[s.state[0][1][2]],
        sg[s.state[2][0][1]]
      ],
      [
        sg[s.state[4][0][2]],
        sg[s.state[0][2][0]],
        sg[s.state[0][2][1]],
        sg[s.state[0][2][1]],
        sg[s.state[0][2][2]],
        sg[s.state[2][0][0]]
      ],
      [null, sg[s.state[1][0][0]], sg[s.state[1][0][1]], sg[s.state[1][0][1]], sg[s.state[1][0][2]], null],
    ];
    return gridColours;
  }

  bool equals(List<List<Sticker?>> o1, List<List<Sticker?>> o2) {
    /// convert them to string format and compare strings
    return convertToStringForm(o1) == convertToStringForm(o2);
  }

  String convertToStringForm(
    List<List<Sticker?>> o1,
  ) {
    return jsonEncode(convertToStringFormList(o1));
  }

  List<List<String?>> convertToStringFormList(List<List<Sticker?>> o1) {
    return o1.map((e) => e.map((e) => e?.name).toList()).toList();
  }

  List<List<Sticker?>> convertFromStringFormList(List<List<String?>> o1) {
    return o1
        .map((e) => e.map((e) => e == null ? null : Sticker.values.firstWhereOrNull((i) => i.name == e)).toList())
        .toList();
  }

  List<List<Sticker?>> convertFromStringForm(String s) {
    return (jsonDecode(s) as List)
        .map((e) =>
            (e as List).map((e) => e == null ? null : Sticker.values.firstWhereOrNull((i) => i.name == e)).toList())
        .toList();
  }
}
