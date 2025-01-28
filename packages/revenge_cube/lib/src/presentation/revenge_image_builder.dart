import 'package:cube_core/cube_core.dart';
import 'package:flutter/material.dart';

import '../../revenge_cube.dart';
import '../infrastructure/cube_state_parser.dart';

final _parser = CubeStateParser();
final _mapper = CubeStateMapper();

class RevengeImageBuilder extends StatelessWidget {
  const RevengeImageBuilder({required this.moves, this.inverse = true, super.key});

  final List<RevengeMove> moves;
  final bool inverse;

  @override
  Widget build(BuildContext context) {
    final cubeState = _parser.cubeStateFromRevengeAlgorithm(inverse ? RevengeMove.invertAlgorithm(moves) : moves, 'z2');

    return RevengeCubeWidget(
      gridColorsOverride: _mapper.parse(cubeState),
    );
  }
}

class CubeStateMapper {
  List<List<Sticker?>> parse(CubeStateEntity s) {
    final sg = [S.w, S.g, S.r, S.b, S.o, S.y];

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
}
