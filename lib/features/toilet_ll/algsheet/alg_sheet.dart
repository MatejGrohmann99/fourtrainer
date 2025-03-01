import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AlgSheet {
  List<AlgInfo> get algorithms;

  Widget imageBuilder(AlgInfo alg);
}

class AlgInfo extends Equatable {
  const AlgInfo({
    required this.name,
    required this.algorithm,
    required this.alternativeAlgorithms,
    required this.description,
    this.setup,
  });

  final String name;
  final String algorithm;
  final String? setup;
  final List<String> alternativeAlgorithms;
  final String description;

  @override
  List<Object?> get props => [
        name,
        algorithm,
        alternativeAlgorithms,
        description,
      ];
}
