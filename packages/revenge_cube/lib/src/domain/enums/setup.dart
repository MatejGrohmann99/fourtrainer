

import '../../generated/four_cycle_setup_algorithms.g.dart';
import '../../generated/four_flip_algorithms.g.dart';
import '../../generated/no_top_flip_algorithms.g.dart';
import '../../generated/three_cycle_setup_algorithms.g.dart';
import '../../generated/ub_flip_algorithms.g.dart';
import '../../generated/uf_flip_algorithms.g.dart';
import '../../generated/uf_ur_ub_flip_algorithms.g.dart';
import '../../generated/ufub_flip_algorithms.g.dart';
import '../../generated/ufur_flip_algorithms.g.dart';
import '../../generated/ur_flip_algorithms.g.dart';
import '../../generated/urbu_flip_algorithms.g.dart';



enum Setup {
  fourCycleSetup,
  threeCycleSetup,
  ufurubFlipSetup,
  ufurFlipSetup,
  ufubFlipSetup,
  urubFlipSetup,
  ufFlipSetup,
  urFlipSetup,
  ubFlipSetup,
  noFlipSetup,
  fourFlipSetup,
  fiveMoveTrigger,
  ;

  List<String> getAlgorithms() {
    switch (this) {
      case Setup.fourCycleSetup:
        return fourCycleSetupAlgorithms;
      case Setup.threeCycleSetup:
        return threeCycleSetupAlgorithms;
      case Setup.ufurubFlipSetup:
        return ufurubFlipAlgorithms;
      case Setup.ufurFlipSetup:
        return ufurFlipAlgorithms;
      case Setup.ufubFlipSetup:
        return ufubFlipAlgorithms;
      case Setup.urubFlipSetup:
        return urbuFlipAlgorithms;
      case Setup.ufFlipSetup:
        return ufFlipAlgorithms;
      case Setup.urFlipSetup:
        return urFlipAlgorithms;
      case Setup.ubFlipSetup:
        return ubFlipAlgorithms;
      case Setup.noFlipSetup:
        return noTopFlipAlgorithm;
      case Setup.fourFlipSetup:
        return fourFlipAlgorithms;
      case Setup.fiveMoveTrigger:
        return ["r U R U' Rw'"];
    }
  }
}
