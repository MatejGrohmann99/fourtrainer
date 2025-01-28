typedef RM = RevengeMove;

enum RevengeMove {
  mR('R'),
  mRi('R\''),
  mR2('R2'),
  mU('U'),
  mUi('U\''),
  mU2('U2'),
  mL('L'),
  mLi('L\''),
  mL2('L2'),
  mF('F'),
  mFi('F\''),
  mF2('F2'),
  mLP(null),
  mDP(null);

  const RevengeMove(this.value);

  final String? value;

  static List<RevengeMove>? parseLine(String l) {
    var line = l;
    // trim all ()
    line = line.replaceAll('(', '');
    line = line.replaceAll(')', '');

    // trim everything within []
    line = line.replaceAllMapped(RegExp(r'\[.*?\]'), (match) => '');

    final individualChars = line.trim().split(' ');
    final charList = <RevengeMove>[];
    for (final char in individualChars) {
      final move = parseChar(char);
      if (move == null) return null;
      charList.add(move);
    }

    return charList;
  }

  static RevengeMove? parseChar(String char) {
    switch (char) {
      case 'R':
        return RevengeMove.mR;
      case 'R\'':
        return RevengeMove.mRi;
      case 'R2':
        return RevengeMove.mR2;
      case 'U':
        return RevengeMove.mU;
      case 'U\'':
        return RevengeMove.mUi;
      case 'U2':
        return RevengeMove.mU2;
      case 'L':
        return RevengeMove.mL;
      case 'L\'':
        return RevengeMove.mLi;
      case 'L2':
        return RevengeMove.mL2;
      case 'F':
        return RevengeMove.mF;
      case 'F\'':
        return RevengeMove.mFi;
      case 'F2':
        return RevengeMove.mF2;
      case 'LP':
        return RevengeMove.mLP;
      case 'DP':
        return RevengeMove.mDP;
      default:
        return null;
    }
  }

  static List<RevengeMove> invertAlgorithm(List<RevengeMove> moves) {
    final invertedMoves = <RevengeMove>[];
    for (final move in moves) {
      invertedMoves.addAll(move.getInverseMoves());
    }
    return invertedMoves.reversed.toList();
  }

  List<RevengeMove> getInverseMoves() {
    switch (this) {
      case mR:
        return [mRi];
      case mRi:
        return [mR];
      case mR2:
        return [mR2];
      case mU:
        return [mUi];
      case mUi:
        return [mU];
      case mU2:
        return [mU2];
      case mL:
        return [mLi];
      case mLi:
        return [mL];
      case mL2:
        return [mL2];
      case mF:
        return [mFi];
      case mFi:
        return [mF];
      case mF2:
        return [mF2];
      case mLP:
        return [mLP];
      case mDP:
        return [mU2, mDP, mU2];
    }
  }
}
