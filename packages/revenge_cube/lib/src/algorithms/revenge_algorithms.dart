import 'package:cube_explorer/annotations.dart';

part 'revenge_algorithms.g.dart';

part 'raw/revenge_algorithms.a_algorithm.dart';

part 'raw/revenge_algorithms.uf_algorithm.dart';

part 'raw/revenge_algorithms.uf_ub_algorithm.dart';

part 'raw/revenge_algorithms.uf_ub_ur_algorithm.dart';

part 'raw/revenge_algorithms.uf_ur_ul_algorithm.dart';

part 'raw/revenge_algorithms.uf_ur_algorithm.dart';

part 'raw/revenge_algorithms.uf_ul_algorithm.dart';

part 'raw/revenge_algorithms.ur_algorithm.dart';

part 'raw/revenge_algorithms.fr_flip_no_flip_algorithm.dart';

part 'raw/revenge_algorithms.four_flip_algorithm.dart';

part 'raw/revenge_algorithms.four_cycle_setup_algorithm.dart';

part 'raw/revenge_algorithms.ub_algorithm.dart';

part 'raw/revenge_algorithms.ur_ub_flip_algorithm.dart';

part 'raw/revenge_algorithms.ur_ul_flip_algorithm.dart';

part 'raw/revenge_algorithms.f_inverse_sexi_algorithm.dart';

part 'raw/revenge_algorithms.r_u_f_u_algorithm.dart';

part 'raw/revenge_algorithms.l_u_f_u_algorithm.dart';

part 'raw/revenge_algorithms.urub_ulflip_algorithm.dart';

part 'raw/revenge_algorithms.ufur_swap_algorithm.dart';

part 'raw/revenge_algorithms.ufultwist_algorithm.dart';

@CubeExplorerAnnotation(
  algorithms: [
    (
      'threeCycleSetupAlgorithms',
      _a,
    ),
    (
      'ufFlipAlgorithms',
      _ufAlgorithmOutput,
    ),
    (
      'ufUbFlipAlgorithms',
      _ufubraw,
    ),
    (
      'ufUbUrFlipAlgorithms',
      _ufuburraw,
    ),
    (
      'ufUrUlFlipAlgorithms',
      _ufurulraw,
    ),
    (
      'ufUrFlipAlgorithms',
      _ufurraw,
    ),
    (
      'ufUlFlipAlgorithms',
      _ulufraw,
    ),
    (
      'urFlipAlgorithms',
      _urraw,
    ),
    (
      'frFlipNoFlipAlgorithms',
      _frRaw,
    ),
    (
      'fourFlipAlgorithms',
      _fourFlipOutput,
    ),
    (
      'fourCycleSetupAlgorithms',
      _foursetupraw,
    ),
    (
      'ubFlipAlgorithms',
      _ubraw,
    ),
    (
      'urUbFlipAlgorithms',
      _urubraw,
    ),
    (
      'urUlFlipAlgorithms',
      _urulraw,
    ),
    (
      'fInverseSexiAlgorithms',
      _finvraw,
    ),
    (
      'rufuAlgorithms',
      _rufuraw,
    ),
    (
      'lufuAlgorithms',
      _lufuraw,
    ),
    (
      'ufurswapAlgorithms',
      _ufurswapraw,
    ),
    (
      'urubulflipAlgorithms',
      _urub_ulflip,
    ),
    (
      'ufultwistAlgorithms',
      _ufultwist,
    ),
  ],
  maxAlgorithmLength: 10,
  maxNumberOfDoubleTurns: 4,
  minAlgorithmLength: 10,
)
class RevengeAlgorithms {
  const RevengeAlgorithms._();
  static const RevengeAlgorithms instance = RevengeAlgorithms._();

  factory RevengeAlgorithms() => instance;
}