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

class OverrideZmrd {
  const OverrideZmrd({
    this.ufl = false,
    this.ufr = false,
    this.urb = false,
    this.urf = false,
    this.ubl = false,
    this.ubr = false,
    this.ulb = false,
    this.ulf = false,
  });

  factory OverrideZmrd.indexujo(int i) {
    final bool ufl = i == 0;
    final bool ufr = i == 1;
    final bool urb = i == 2;
    final bool urf = i == 3;
    final bool ubl = i == 4;
    final bool ubr = i == 5;
    final bool ulb = i == 6;
    final bool ulf = i == 7;

    return OverrideZmrd(
      ufl: ufl,
      ufr: ufr,
      urb: urb,
      urf: urf,
      ubl: ubl,
      ubr: ubr,
      ulb: ulb,
      ulf: ulf,
    );
  }

  final bool ufl;
  final bool ufr;
  final bool urb;
  final bool urf;
  final bool ubl;
  final bool ubr;
  final bool ulb;
  final bool ulf;
}

const overrideEdgeColor = Colors.deepPurple;

class RevengeCubeWidget extends StatelessWidget {
  const RevengeCubeWidget({
    this.width = 150,
    this.height = 150,
    super.key,
    this.colors,
    this.gridColorsOverride,
    this.override,
  });

  final double width;

  final double height;

  final RevengeCaseImageReference? colors;

  final List<List<Sticker?>>? gridColorsOverride;

  final OverrideZmrd? override;

  Widget build(BuildContext context) {
    final gridColoursDefault = [
      [Colors.transparent, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.transparent],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.grey],
      [Colors.transparent, Colors.grey, Colors.grey, Colors.grey, Colors.grey, Colors.transparent],
    ];

    final sideEdges = <(int, int), Color>{};

    final gridColors = _mapper.parseReference(colors, gridColorsOverride);

    gridColors.forEach(
      (key, color) {
        if (key.$1 < 0) {
          final convertKeyToPositive = (key.$1.abs() - 1, key.$2.abs() - 1);
          sideEdges[convertKeyToPositive] = _getColor(color);
          return;
        }
        gridColoursDefault[key.$1][key.$2] = _getColor(color);
      },
    );

    if (override case final over?) {
      if (over.ufr) {
        gridColoursDefault[5][3]= overrideEdgeColor;
        gridColoursDefault[4][3]= overrideEdgeColor;
      }

      if (over.ufl) {
        gridColoursDefault[5][2]= overrideEdgeColor;
        gridColoursDefault[4][2]= overrideEdgeColor;
      }

      if (over.ubl) {
        gridColoursDefault[0][2]= overrideEdgeColor;
        gridColoursDefault[1][2]= overrideEdgeColor;
      }

      if (over.ubr) {
        gridColoursDefault[0][3]= overrideEdgeColor;
        gridColoursDefault[1][3]= overrideEdgeColor;
      }

      if (over.urb) {
        gridColoursDefault[2][4]= overrideEdgeColor;
        gridColoursDefault[2][5]= overrideEdgeColor;
      }

      if (over.urf) {
        gridColoursDefault[3][4]= overrideEdgeColor;
        gridColoursDefault[3][5]= overrideEdgeColor;
      }

      if (over.ulf) {
        gridColoursDefault[3][0]= overrideEdgeColor;
        gridColoursDefault[3][1]= overrideEdgeColor;
      }

      if (over.ulb) {

        gridColoursDefault[2][0]= overrideEdgeColor;
        gridColoursDefault[2][1]= overrideEdgeColor;
      }
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: SizedBox(
          width: width + 20,
          height: height + 20,
          child: CustomPaint(
            size: Size(width, height), // Adjust size as needed
            painter: _GridPainter(gridColoursDefault, sideEdges),
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
