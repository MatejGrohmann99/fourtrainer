import 'dart:io';
import 'dart:math';

void main() async {
  print('PRINTUJO3');
  const algCount = 200;

  final f2U2 = await File('1.txt').readAsString();
  final f2U2Cases = f2U2.split('\n').map((e) => e.replaceAll('(', '').replaceAll(')', '')).toList();

  final f2U2flip = await File('2.txt').readAsString();
  final f2U2flipCases = f2U2flip.split('\n').map((e) => e.replaceAll('(', '').replaceAll(')', '')).toList();
  final random = Random();

  for (var i = 0; i < algCount; i++) {
    final f2U2Setup = 'D2 B2 D2 ' + f2U2Cases[random.nextInt(f2U2Cases.length)];
    final f2U2flipSetup = "D' B L B' D " + f2U2flipCases[random.nextInt(f2U2flipCases.length)];

    if (random.nextBool()) {
      if (random.nextBool()) {
        print('"' + "Rw U2 Rw D Rw' U2 Rw D' Rw2' " + f2U2flipSetup + '",');
      } else {
        print('"' + "Rw U2 Rw D Rw' U2 Rw D' Rw2' " + f2U2flipSetup + '",');
      }
    } else {
      if (random.nextBool()) {
        print('"' + f2U2flipSetup + " Rw U2 Rw D Rw' U2 Rw D' Rw2' " + f2U2Setup + '",');
      } else {
        print('"' + f2U2flipSetup + " Rw U2 Rw D Rw' U2 Rw D' Rw2' " + f2U2Setup + '",');
      }
    }
  }
}
