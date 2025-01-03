import 'package:revenge_cube/src/domain/enums/revenge_case.dart';

class RevengeScramble {
  final String scramble;
  final RevengeCase? situation;

  const RevengeScramble({
    required this.scramble,
    required this.situation,
  });

  Map<String, dynamic> toJsonMap() {
    return {
      'scramble': scramble,
      'situation': situation?.json,
    };
  }

  static RevengeScramble? fromJsonMap(Map<String, dynamic>? json) {
    if (json == null) return null;
    if (json['scramble'] == null) return null;
    return RevengeScramble(
      scramble: json['scramble'] as String,
      situation: RevengeCase.fromJson(json['situation'] as String?),
    );
  }
}
