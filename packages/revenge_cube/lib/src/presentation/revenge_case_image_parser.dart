import '../../revenge_cube.dart';

typedef RevengeCaseImagePiece = (Sticker, Sticker, Sticker, Sticker);

class RevengeCaseImageReference {
  RevengeCaseImagePiece? fl;

  /// fr: (S.r, S.y, S.g, S.o),
  /// first two are F face, next to are R face
  RevengeCaseImagePiece? fr;

  /// uf: (S.y, S.y, S.o, S.g)
  /// first two are F face, next two are top face
  RevengeCaseImagePiece? uf;

  ///ub: (S.g, S.g, S.y, S.r),
  /// first two are B face, next to are top face
  RevengeCaseImagePiece? ub;

  RevengeCaseImagePiece? ul;
  RevengeCaseImagePiece? ur;

  RevengeCaseImageReference({
    this.fl,
    this.fr,
    this.uf,
    this.ub,
    this.ul,
    this.ur,
  });
}

class RevengeCaseImageParser {
  Map<(int, int), Sticker> parseReference(RevengeCaseImageReference? reference, List<List<Sticker?>>? override) {
    final map = <(int, int), Sticker>{};
    if (reference == null && override == null) {
      return map;
    }

    if (override case final override?) {
      if (override.length != 6) return map;
      if (override.any((e) => e.length != 6)) return map;

      for (var i = 0; i < 6; i++) {
        for (var j = 0; j < 6; j++) {
          if (override[i][j] == null) continue;
          map.addAll({
            (i, j): override[i][j]!,
          });
        }
      }
    } else if (reference != null) {
      if (reference.ub case final ub?) {
        map.addAll({
          (0, 2): ub.$1,
          (0, 3): ub.$2,
          (1, 2): ub.$3,
          (1, 3): ub.$4,
        });
      }
      if (reference.uf case final uf?) {
        map.addAll({
          (5, 2): uf.$1,
          (5, 3): uf.$2,
          (4, 2): uf.$3,
          (4, 3): uf.$4,
        });
      }
      if (reference.ul case final ul?) {
        map.addAll({
          (2, 0): ul.$1,
          (3, 0): ul.$2,
          (2, 1): ul.$3,
          (3, 1): ul.$4,
        });
      }
      if (reference.ur case final ur?) {
        map.addAll({
          (2, 5): ur.$1,
          (3, 5): ur.$2,
          (2, 4): ur.$3,
          (3, 4): ur.$4,
        });
      }
      if (reference.fl case final fl?) {
        map.addAll({
          (-1, 1): fl.$1,
          (-2, 1): fl.$2,
          (-1, 2): fl.$3,
          (-2, 2): fl.$4,
        });
      }
      if (reference.fr case final fr?) {
        map.addAll({
          (-1, 11): fr.$1,
          (-2, 11): fr.$2,
          (-1, 12): fr.$3,
          (-2, 12): fr.$4,
        });
      }
    }
    return map;
  }
}
