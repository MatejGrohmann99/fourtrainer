import 'dart:io';
import 'dart:math';

void main() async {
  print('PRINTUJO3');
  const algCount = 400;

  final f2U2 = await File('3.txt').readAsString();
  final f2U2Cases = f2U2.split('\n').map((e) => e.replaceAll('(', '').replaceAll(')', '')).toList();

  final f2U2flip = await File('4.txt').readAsString();
  final f2U2flipCases = f2U2flip.split('\n').map((e) => e.replaceAll('(', '').replaceAll(')', '')).toList();
  final random = Random();

  for (var i = 0; i < algCount; i++) {
    final f2U2Setup = "L F L' " + f2U2Cases[random.nextInt(f2U2Cases.length)];
    final f2U2flipSetup = "L F2 L' " + f2U2flipCases[random.nextInt(f2U2flipCases.length)];

    if (random.nextBool()) {
      if (random.nextBool()) {
        print('"' + "Rw2 F2 Rw2 U' Rw2 F2 Rw2 " + f2U2flipSetup + '",');
      } else {
        print('"' + "Rw2 F2 Rw2 U' Rw2 F2 Rw2 " + f2U2flipSetup + '",');
      }
    } else {
      if (random.nextBool()) {
        print('"' + f2U2flipSetup + " Rw2 F2 Rw2 U' Rw2 F2 Rw2 " + f2U2Setup + '",');
      } else {
        print('"' + f2U2flipSetup + " Rw2 F2 Rw2 U' Rw2 F2 Rw2 " + f2U2Setup + '",');
      }
    }
  }
}
