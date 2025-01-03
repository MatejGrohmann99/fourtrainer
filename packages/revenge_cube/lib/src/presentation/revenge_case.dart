import 'package:flutter/material.dart';

import '../domain/enums/sticker.dart';

class _GridPainter extends CustomPainter {
  final List<List<Color>> gridColors;

  _GridPainter(this.gridColors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    double cellWidth = size.width / 6;
    double cellHeight = size.height / 6;
    final inCellWidth = size.width / 6 * 0.9;
    final inCellHeight = size.height / 6 * 0.9;

    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 6; j++) {
        if (i == 0 && (j == 0 || j == 5)) {
          continue;
        }
        if (i == 5 && (j == 0 || j == 5)) {
          continue;
        }

        paint.color = gridColors[i][j];

        if (i == 0 || i == 5 || j == 0 || j == 5) {
          canvas.drawRect(
            Rect.fromLTWH(j * cellWidth, i * cellHeight, inCellWidth, inCellWidth),
            paint,
          );
          continue;
        }

        canvas.drawRect(
          Rect.fromLTWH(j * cellWidth, i * cellHeight, inCellWidth, inCellHeight),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RevengeCubeWidget extends StatelessWidget {
  const RevengeCubeWidget({this.width = 150, this.height = 150, super.key, this.gridColors});

  final double width;

  final double height;

  final Map<(int, int), S>? gridColors;

  @override
  Widget build(BuildContext context) {
    final gridColoursDefault = [
      [Colors.transparent, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.transparent],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.transparent, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.transparent],
    ];

    gridColors?.forEach(
      (key, color) {
        gridColoursDefault[key.$1][key.$2] = switch (color) {
          // because flutter is stupid
          S.w => const MaterialColor(
              0xFFFFFFFF, // Base white color
              <int, Color>{
                50: Color(0xFFFFFFFF),
                100: Color(0xFFFFFFFF),
                200: Color(0xFFFFFFFF),
                300: Color(0xFFFFFFFF),
                400: Color(0xFFFFFFFF),
                500: Color(0xFFFFFFFF),
                600: Color(0xFFFFFFFF),
                700: Color(0xFFFFFFFF),
                800: Color(0xFFFFFFFF),
                900: Color(0xFFFFFFFF),
              },
            ),
          S.y => Colors.yellow,
          S.o => Colors.orange,
          S.r => Colors.red,
          S.g => Colors.green,
          S.b => Colors.blue,
        };
      },
    );

    return Center(
      child: SizedBox(
        width: width + 20,
        height: height + 20,
        child: CustomPaint(
          size: Size(width, height), // Adjust size as needed
          painter: _GridPainter(gridColoursDefault),
        ),
      ),
    );
  }
}
