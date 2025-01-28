import 'package:fourtrainer/alg_sheet/alg_sheet.dart';

import 'no_pll_alg_sheets.dart';

class ToiletSwapUParity extends NoPllAlgSheet {
  @override
  List<AlgInfo> get algorithms => const [
        AlgInfo(
          name: "Pure DP",
          algorithm: "DP",
          alternativeAlgorithms: [],
          description: "Self explanatory",
        ),
        AlgInfo(
          name: "Pure LP",
          algorithm: "LP",
          alternativeAlgorithms: [],
          description: "Self explanatory",
        ),
        AlgInfo(
          name: "PP swap",
          algorithm: "U' R' U2 R U R' LP U R U R' U' R U R' U2 R",
          alternativeAlgorithms: [
            "U' R U2 R' U' R U2 LP U R' U' R U R' U R U2 R'",
          ],
          description: "Long setup into sune because i hate H perm",
        ),
        AlgInfo(
          name: "H perm",
          algorithm: "R U R2 F R F' U' F R' F' R F' DP F",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
        AlgInfo(
          name: "",
          algorithm: "",
          alternativeAlgorithms: [],
          description: "",
        ),
      ];
}
