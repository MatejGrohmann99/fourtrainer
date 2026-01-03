import 'package:flutter/material.dart';
import 'package:revenge_cube/src/presentation/revenge_case_image_parser.dart';

import '../domain/enums/sticker.dart';

class _GridPainter extends CustomPainter {
  final List<List<Color>> gridColors;
  final Map<(int, int), Color> sideEdges;

  _GridPainter(this.gridColors, this.sideEdges);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    double cellWidth = size.width / 7;
    double cellHeight = size.height / 7;
    final inCellWidth = size.width / 7 * 0.9;
    final inCellHeight = size.height / 7 * 0.9;

    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 7; j++) {
        if (i == 0 && (j == 0 || j == 6)) {
          continue;
        }
        if (i == 6 && (j == 0 || j == 6)) {
          continue;
        }

        paint.color = gridColors[i][j];

        if (i == 0 || i == 6 || j == 0 || j == 6) {
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

    // Draw side edges
    sideEdges.forEach((key, color) {
      final (row, col) = key;
      paint.color = color;

      final sideCellHeight = cellHeight * 0.55;
      final sideCellWidth = cellWidth * 0.55;

      final edgeWidth = cellWidth * 0.45;
      final edgeHeight = cellHeight * 0.50;
      final x = (col - 0.5) * sideCellWidth + (sideCellWidth - edgeWidth) / 2;
      final y = (row + 9.5) * sideCellHeight + (sideCellHeight - edgeHeight) / 2;

      canvas.drawRect(Rect.fromLTWH(x, y, edgeWidth, edgeHeight), paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

final _mapper = RevengeCaseImageParser();

class ProfessorCubeWidget extends StatelessWidget {
  const ProfessorCubeWidget({this.demension = 5, this.width = 150, this.height = 150, super.key, this.gridColorsOverride});

  final int demension;

  final double width;

  final double height;

  final List<List<Sticker?>>? gridColorsOverride;

  @override
  Widget build(BuildContext context) {
    final gridColoursDefault = [
      [Colors.transparent, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.transparent],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.transparent, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.transparent],
    ];

    final opagrey = Colors.grey;

    final pouzehranol = [
      [Colors.transparent,opagrey, Colors.grey, Colors.grey, Colors.grey, opagrey, Colors.transparent],
      [opagrey, opagrey, Colors.grey, Colors.grey, Colors.grey, opagrey, opagrey],
      [opagrey, opagrey, opagrey, opagrey, opagrey, opagrey, opagrey],
      [opagrey, opagrey, opagrey, opagrey, opagrey, opagrey, opagrey],
      [opagrey, opagrey, opagrey, opagrey, opagrey, opagrey, opagrey],
      [opagrey,opagrey, Colors.grey, Colors.grey, Colors.grey, opagrey, opagrey],
      [Colors.transparent, opagrey, Colors.grey, Colors.grey, Colors.grey, opagrey, Colors.transparent],
    ];


    final sideEdges = <(int, int), Color>{};

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: SizedBox(
          width: width + 20,
          height: height + 20,
          child: CustomPaint(
            size: Size(width, height),
            painter: _GridPainter(pouzehranol, sideEdges),
          ),
        ),
      ),
    );
  }

  Color _getColor(Sticker color) {
    return switch (color) {
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
  }
}
