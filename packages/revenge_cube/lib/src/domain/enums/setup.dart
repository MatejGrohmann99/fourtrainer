import 'package:revenge_cube/src/algorithms/revenge_algorithms.dart';

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
  fInverseSexiSetup,
  rUFUSetup,
  ulurSetup,
  rotationFsexiSetup,
  ufurulSetup,
  ufulSetup,
  ufulTwistSetup,
  urubswapulflipSetup,
  ;

  List<String> getAlgorithms() {
    switch (this) {
      case Setup.fourCycleSetup:
        return RevengeAlgorithms().fourCycleSetupAlgorithms;
      case Setup.threeCycleSetup:
        return RevengeAlgorithms().threeCycleSetupAlgorithms;
      case Setup.ufurubFlipSetup:
        return RevengeAlgorithms().fourFlipAlgorithms;
      case Setup.ufurFlipSetup:
        return RevengeAlgorithms().ufUrFlipAlgorithms;
      case Setup.ufubFlipSetup:
        return RevengeAlgorithms().ufUbFlipAlgorithms;
      case Setup.urubFlipSetup:
        return RevengeAlgorithms().urUbFlipAlgorithms;
      case Setup.ufFlipSetup:
        return RevengeAlgorithms().ufFlipAlgorithms;
      case Setup.urFlipSetup:
        return RevengeAlgorithms().urFlipAlgorithms;
      case Setup.ubFlipSetup:
        return RevengeAlgorithms().ubFlipAlgorithms;
      case Setup.noFlipSetup:
        return RevengeAlgorithms().frFlipNoFlipAlgorithms;
      case Setup.fourFlipSetup:
        return RevengeAlgorithms().fourFlipAlgorithms;
      case Setup.fiveMoveTrigger:
        return ["r U R U' Rw'"];
      case Setup.fInverseSexiSetup:
        return RevengeAlgorithms().fInverseSexiAlgorithms;
      case Setup.rUFUSetup:
        return RevengeAlgorithms().rufuAlgorithms;
      case Setup.ulurSetup:
        return RevengeAlgorithms().urUlFlipAlgorithms;
      case Setup.rotationFsexiSetup:
        return RevengeAlgorithms().lufuAlgorithms;
      case Setup.ufurulSetup:
        return RevengeAlgorithms().ufUrUlFlipAlgorithms;
      case Setup.ufulSetup:
        return RevengeAlgorithms().ufUlFlipAlgorithms;
      case Setup.ufulTwistSetup:
        return RevengeAlgorithms().ufultwistAlgorithms;
      case Setup.urubswapulflipSetup:
        return RevengeAlgorithms().urubulflipAlgorithms;
    }
  }
}
