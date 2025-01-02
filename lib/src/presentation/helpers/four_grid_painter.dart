import 'package:flutter/material.dart';

import '../../domain/case.dart';

class GridPainter extends CustomPainter {
  final List<List<Color>> gridColors;

  GridPainter(this.gridColors);

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

class GridWidget extends StatelessWidget {
  const GridWidget({this.width = 200, this.height = 200, super.key, this.gridColors});

  final double width;

  final double height;

  final Map<(int, int), Sticker>? gridColors;

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
          Sticker.white => const MaterialColor(
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
          Sticker.yellow => Colors.yellow,
          Sticker.orange => Colors.orange,
          Sticker.red => Colors.red,
          Sticker.green => Colors.green,
          Sticker.blue => Colors.blue,
        };
      },
    );

    return CustomPaint(
      size: Size(width, height), // Adjust size as needed
      painter: GridPainter(gridColoursDefault),
    );
  }
}
