import 'package:cube_explorer/annotations.dart';

part 'better_setup.g.dart';

part 'raw/uf_ub_fr_no_swap_algorithm.dart';

part 'raw/ub_rf_swap_uf_wont_move_algorithm.dart';

part 'raw/f_inv_sexi_but_fr_wont_move_algorithm.dart';

part 'raw/lufu_but_fr_stay_algorithm.dart';

part 'raw/rufu_but_fr_stay_algorithm.dart';

part 'raw/ufub_flip_fr_stay_algorithm.dart';

@CubeExplorerAnnotation(
  algorithms: [
    (
      'UFUBFRNoSwapAlgorithm',

      /// Desc:
      /// Does not effect UF UB FR
      /// will not effect cross pieces
      /// will destroy and flip edges UL UR BL BR FL
      _ufubfrnoswap,
    ),
    (
      'UBRFSwapUFWontMoveAlgorithm',

      /// Desc:
      /// will Swap UB RF
      /// will not effect cross pieces and FR
      /// will destroy and flip edges UL UR BL BR FL
      _ubrfswapufwontmoveraw,
    ),
    (
      'FInvSexiButFrWontMoveAlgorithm',

      /// Desc:
      /// will do F inv sexi F' on UF and UB edges
      /// will not effect cross pieces and FR
      /// will destroy and flip edges UL UR BL BR FL
      _rawFinv,
    ),
    (
      'LUFUbutFRwontMoveAlgorithm',

      /// Desc
      /// Will do L U F U' L' F' on LL
      /// FR edge will not move
      /// will not effect cross edges
      _lufuraw,
    ),
    (
      'RUFUbutFRwontMoveAlgorithm',

      /// Desc
      /// Will do R' U' F' U F R on LL
      /// FR edge will not move
      /// will not effect cross edges
      _rufuraw,
    ),
    (
      'UFUBFlipFRWontMoveAlgorithm',

      /// Desc
      /// flips UF and UB
      /// FR and cross will not move
    _ufubflipfrstayraw
    ),
  ],
  maxAlgorithmLength: 10,
  maxNumberOfDoubleTurns: 4,
  minAlgorithmLength: 10,
)
class BetterSetup {
  const BetterSetup._();

  static const BetterSetup instance = BetterSetup._();

  factory BetterSetup() => instance;
}
