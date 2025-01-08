class CubeExplorerAnnotation {

  final List<(String, String)> algorithms;

  final int minAlgorithmLength;
  final int maxAlgorithmLength;
  final int maxNumberOfDoubleTurns;

  const CubeExplorerAnnotation({
    required this.algorithms,
    required this.minAlgorithmLength,
    required this.maxAlgorithmLength,
    required this.maxNumberOfDoubleTurns,
  });
}

