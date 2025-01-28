
import 'package:fourtrainer/sheets/no_pll_alg_sheets.dart';
import '../alg_sheet/alg_sheet.dart';

class NoSwapUParity extends NoPllAlgSheet {
  @override
  List<AlgInfo> get algorithms => const [
        AlgInfo(
          name: 'No swap',
          algorithm: "U R U2 R' U' R U' R' U2 F R' F' R U R U' R' LP",
          alternativeAlgorithms: [],
          description: 'Antisune setup to better case',
        ),
        AlgInfo(
          name: 'Pll opp parity swap',
          algorithm: "F R U' R' DP R U R' F'",
          alternativeAlgorithms: [],
          description: '',
        ),
        AlgInfo(
          name: 'Side opp parity swap',
          algorithm: "U' R U R' U R U' R' U' R' F R F' U DP",
          alternativeAlgorithms: [],
          description: 'W OLL into drew',
        ),
        AlgInfo(
          name: 'H perm',
          algorithm: "U' R U R' U R U' R' U' R' F R F' U LP",
          alternativeAlgorithms: [],
          description: 'W Oll into lucas',
        ),
        AlgInfo(
          name: 'Left Z perm',
          algorithm: "F' r U R' U' r' F R LP",
          setup: "F' L F R' F' L' F R LP",
          alternativeAlgorithms: [],
          description: 'Lefty L ZB into lucas',
        ),
        AlgInfo(
          name: 'Righty Z perm',
          algorithm: "F R' F' r U R U' r' LP",
          setup: "F R' F' L F R F' L' LP",
          alternativeAlgorithms: [],
          description: 'Righty L ZB into lucas',
        ),
        AlgInfo(
          name: 'Front right adj swap',
          algorithm: "U' F R U' R' U' R U R' F' U2 DP",
          alternativeAlgorithms: ["F' L F L' U' L' U L DP"],
          description: 'Easy oll into drew',
        ),
        AlgInfo(
          name: 'Front left adj swap',
          algorithm: "F R' F' R U R U' R' DP",
          alternativeAlgorithms: [],
          description: 'SPAM',
        ),
        AlgInfo(
          name: 'Back right adj swap',
          algorithm: "R' U' F' U F R U' R' DP U2 R",
          alternativeAlgorithms: ["R' F R' F' R2 DP R' U R"],
          description: "Orient corners and preserve bloc => R' DP R",
        ),
        AlgInfo(
          name: 'Back left adj swap',
          algorithm: "U' F U R U' R' F' R U2 DP R'",
          alternativeAlgorithms: ["r U R' U' r' F U R' U' F' DP"],
          description: "Orient corners and preserve bloc => R DP R'",
        ),
        AlgInfo(
          name: 'Back Ua perm',
          algorithm: "R' U' R LP R' U R U' F U R U' R' F'",
          alternativeAlgorithms: ["U LP U F' L F L' U2 L' U2 L"],
          description: 'Take back pair, parity, insert into 6 move LL',
        ),
        AlgInfo(
          name: 'Back Ub perm',
          algorithm: "U' LP U' F R' F' R U2 R U2 R'",
          alternativeAlgorithms: [],
          description: 'Parity into 8 mover',
        ),
        AlgInfo(
          name: 'FR W perm',
          algorithm: "U' F U R U' R' F' U2 R' DP U2 R",
          alternativeAlgorithms: ["R U R2 F R F' r U' r' U r U r' DP"],
          description: '',
        ),
        AlgInfo(
          name: 'FL W perm',
          algorithm: "R' U' F' U F R U R U2 DP R'",
          alternativeAlgorithms: ["U R' U2 R U R' U R F R' F' R U R U' R' DP"],
          description: 'shit',
        ),
        AlgInfo(
          name: 'Front Ua perm',
          algorithm: "F' R U2 R' U2 R' F R U R U' R' LP",
          alternativeAlgorithms: [],
          description: 'Easy zb into LP',
        ),
        AlgInfo(
          name: 'Front Ub perm',
          algorithm: "F R U R' U' R' F' R U2 R U2 R' LP",
          alternativeAlgorithms: [],
          description: 'Easy zb into LP',
        ),
        AlgInfo(
          name: 'BR W perm',
          algorithm: "F R U R' U' R' F' R U2 R U2 R' DP",
          alternativeAlgorithms: [],
          description: 'Easy zb into DP',
        ),
        AlgInfo(
          name: 'BL W perm',
          algorithm: "F' R U2 R' U2 R' F R U R U' R' DP",
          alternativeAlgorithms: [],
          description: 'Easy zb into DP',
        ),
        AlgInfo(
          name: 'Left Ua perm',
          algorithm: "F R' F' R U R U' R' LP",
          alternativeAlgorithms: [],
          description: '',
        ),
        AlgInfo(
          name: 'Left Ub perm',
          algorithm: "F' L' U L LP F R U' R'",
          alternativeAlgorithms: [],
          description: '',
        ),
        AlgInfo(
          name: 'Right Ua perm',
          algorithm: "F R U' R' LP U2 R U R' F'",
          alternativeAlgorithms: [],
          description: '',
        ),
        AlgInfo(
          name: 'Right Ub perm',
          algorithm: "U' F R U' R' U' R U R' F' U2 LP",
          alternativeAlgorithms: ["F' L F L' U' L' U L LP"],
          description: '',
        ),
        AlgInfo(
          name: 'Oa perm',
          algorithm: "F' r U R' U' r' F R DP",
          setup: "F' L F R' F' L' F R DP",
          alternativeAlgorithms: [],
          description: '',
        ),
        AlgInfo(
          name: 'Ob perm',
          algorithm: "F R' F' r U R U' r' DP",
          setup: "F R' F' L F R F' L' DP",
          alternativeAlgorithms: [],
          description: '',
        ),
      ];

}
