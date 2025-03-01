import '../config/constants.dart';

typedef CSE = CubeStateEntity;

class CubeStateEntity {
  final List<List<List<int>>> state;

  const CubeStateEntity._internal(this.state);

  const CubeStateEntity() : this._internal(CubeConstants.solvedState);

  Map<String, dynamic> toMap() {
    return {
      'state': state,
    };
  }

  factory CubeStateEntity.fromMap(Map<String, dynamic> map) {
    return CubeStateEntity._internal(map['state']);
  }

  CubeStateEntity copyWith({
    List<List<List<int>>>? state,
  }) {
    return CubeStateEntity._internal(
      state ?? this.state,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! CubeStateEntity) return false;

    return _equals(state[0][0], other.state[0][0]) &&
        _equals(state[0][1], other.state[0][1]) &&
        _equals(state[0][2], other.state[0][2]) &&
        _equals(state[1][0], other.state[1][0]) &&
        _equals(state[1][1], other.state[1][1]) &&
        _equals(state[1][2], other.state[1][2]) &&
        _equals(state[2][0], other.state[2][0]) &&
        _equals(state[2][1], other.state[2][1]) &&
        _equals(state[2][2], other.state[2][2]) &&
        _equals(state[3][0], other.state[3][0]) &&
        _equals(state[3][1], other.state[3][1]) &&
        _equals(state[3][2], other.state[3][2]) &&
        _equals(state[4][0], other.state[4][0]) &&
        _equals(state[4][1], other.state[4][1]) &&
        _equals(state[4][2], other.state[4][2]) &&
        _equals(state[5][0], other.state[5][0]) &&
        _equals(state[5][1], other.state[5][1]) &&
        _equals(state[5][2], other.state[5][2]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      state[0][0].hashCode ^
      state[0][1].hashCode ^
      state[0][2].hashCode ^
      state[1][0].hashCode ^
      state[1][1].hashCode ^
      state[1][2].hashCode ^
      state[2][0].hashCode ^
      state[2][1].hashCode ^
      state[2][2].hashCode ^
      state[3][0].hashCode ^
      state[3][1].hashCode ^
      state[3][2].hashCode ^
      state[4][0].hashCode ^
      state[4][1].hashCode ^
      state[4][2].hashCode ^
      state[5][0].hashCode ^
      state[5][1].hashCode ^
      state[5][2].hashCode;
}

bool _equals(List<int>? a, List<int>? b) {
  if (a == null) {
    return b == null;
  }
  if (b == null || a.length != b.length) {
    return false;
  }
  if (identicalInt(a, b)) {
    return true;
  }
  for (int index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) {
      return false;
    }
  }
  return true;
}

bool identicalInt(List<int> a, List<int> b) {
  for (int index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) {
      return false;
    }
  }
  return true;
}