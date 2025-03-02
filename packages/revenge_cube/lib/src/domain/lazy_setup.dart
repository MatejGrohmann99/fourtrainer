import 'package:revenge_cube/revenge_cube.dart';

class LazySetup with SetupMixin {
  const LazySetup(this.algorithms);

  final List<String> algorithms;

  @override
  List<String> getAlgorithms() {
    return algorithms;
  }
}

