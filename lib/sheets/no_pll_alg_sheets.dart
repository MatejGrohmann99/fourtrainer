
import 'package:flutter/material.dart';
import 'package:fourtrainer/sheets/no_swap_u_parity.dart';
import 'package:fourtrainer/sheets/toilet_swap_u_parity.dart';
import 'package:revenge_cube/revenge_cube.dart';

import '../alg_sheet/alg_sheet.dart';

List<AlgSheet> getNoPllAlgSheets() {
  return [
    NoSwapUParity(),
    ToiletSwapUParity(),
  ];
}

abstract class NoPllAlgSheet extends AlgSheet {
  @override
  Widget imageBuilder(AlgInfo alg) {
    final moves = RevengeMove.parseLine(alg.setup ?? alg.algorithm);
    return RevengeImageBuilder(moves: moves ?? []);
  }
}