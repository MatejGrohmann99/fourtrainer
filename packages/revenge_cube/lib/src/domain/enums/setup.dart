import 'package:revenge_cube/src/algorithms/revenge_algorithms.dart';

enum Setup {
  twoCycleSetup,
  fourCycleSetup,
  twoTwoCycleSetup,
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
  ufurSwapTwistUF,
  ufurSwapTwistUR,
  ublfSwapSetup,
  leftSexiMoveSetup,
  rightSexiMoveSetup,
  ubrfSwapSetup,
  ufurSwapSetup,
  suneSetup,
  ;

  List<String> getAlgorithms() {
    switch (this) {
      case Setup.twoTwoCycleSetup:
        return RevengeAlgorithms().twoTwoCycleSetupAlgorithms;
      case Setup.twoCycleSetup:
        return RevengeAlgorithms().twoCycleTopSetupAlgorithms;
      case Setup.fourCycleSetup:
        return RevengeAlgorithms().fourCycleSetupAlgorithms;
      case Setup.threeCycleSetup:
        return RevengeAlgorithms().threeCycleSetupAlgorithms;
      case Setup.ufurubFlipSetup:
        return RevengeAlgorithms().threeFlipAlgorithms;
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
      case Setup.ufurSwapTwistUF:
        return RevengeAlgorithms().UFURswapTwistUF;
      case Setup.ufurSwapTwistUR:
        return RevengeAlgorithms().UFURswapTwistUR;
      case Setup.ublfSwapSetup:
        return RevengeAlgorithms().UBLFswapAlgorithms;
      case Setup.leftSexiMoveSetup:
        return RevengeAlgorithms().leftSexiMoveAlgorithms;
      case Setup.rightSexiMoveSetup:
        return RevengeAlgorithms().rightSexiMoveAlgorithms;
      case Setup.ubrfSwapSetup:
        return RevengeAlgorithms().UBRFswapAlgorithms;
      case Setup.ufurSwapSetup:
        return RevengeAlgorithms().ufurswapAlgorithms;
      case Setup.suneSetup:
        return RevengeAlgorithms().suneAlgorithms;
    }
  }
}
