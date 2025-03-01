import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revenge_cube/revenge_cube.dart';

class TllPage extends StatelessWidget {
  const TllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          _Gap(),
          _Headline('TLL - Toilet Last Layer'),
          _Gap(),
          _Text(
              'Toilet last layer is a alternative method to solve last layer of 4x4 while having OLL parity present. \n\nMethod consist of:\n1. Setup into OLL parity case (TOLL)\n2. Solve OLL parity in one algorithm consisting Drew/Lucas parity (based on pll parity state)\n3. Nothing, just AUF'),
          _Gap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Img("F R U R' U' F' U2 R U R' U R U' R' U' R' F R F' U DP"),
              _Gap(),
              _Arrow(),
              _Gap(),
              _Img("U' R U R' U R U' R' U' R' F R F' U DP"),
              _Gap(),
              _Arrow(),
              _Gap(),
              _Img('U'),
              _Gap(),
            ],
          ),
          _Gap(),
          _Headline('TOLL / Setup into oll parity'),
          _Gap(),
          Wrap(
            children: [
              _Oll("R U2 R' U' R U' R'"),
              _Oll("R U R' U R U2 R'"),
              _Oll("R U R' U' R' F R F' U2"),
              _Oll("R U R' U' R' F R F' U"),
              _Oll("R U R' U' R' F R F' U'"),
            ],
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.mediaQuery.size.width / 1.2,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        ),
      ),
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.arrow_right_alt_rounded,
      size: 24,
    );
  }
}

class _Oll extends StatelessWidget {
  const _Oll(this.solution);

  final String solution;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          RevengeImageBuilder(
            moves: RevengeMove.parseLine("$solution DP") ?? [],
            overrideSideColors: true,
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      solution,
                      maxLines: 3,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Img extends StatelessWidget {
  const _Img(this.solution);

  final String solution;

  @override
  Widget build(BuildContext context) {
    return RevengeImageBuilder(
      moves: RevengeMove.parseLine(solution) ?? [],
    );
  }
}

class _Gap extends StatelessWidget {
  const _Gap();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 12,
      width: 12,
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.mediaQuery.size.width / 1.2,
        height: 50,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
