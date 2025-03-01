import 'package:cube_core/cube_core.dart';
import 'package:flutter/material.dart';

import '../../revenge_cube.dart';
import '../infrastructure/cube_state_parser.dart';
import '../mappers/cube_state_mapper.dart';

final _parser = CubeStateParser();
final _mapper = CubeStateMapper();

class RevengeImageBuilder extends StatelessWidget {
  const RevengeImageBuilder({required this.moves, this.inverse = true, this.size, super.key, this.overrideSideColors = false});

  final List<RevengeMove> moves;
  final double? size;
  final bool inverse;
  final bool overrideSideColors;

  @override
  Widget build(BuildContext context) {
    final cubeState = _parser.cubeStateFromRevengeAlgorithm(inverse ? RevengeMove.invertAlgorithm(moves) : moves, ['z2']);

    return RevengeCubeWidget(
      width: size ?? 150,
      height: size ?? 150,
      gridColorsOverride: _mapper.parse(cubeState, overrideSideColors: overrideSideColors),
    );
  }
}
