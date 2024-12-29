

import 'package:flutter/material.dart';

class ScrambleSection extends StatelessWidget {
  const ScrambleSection({this.scramble, super.key});

  final String? scramble;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 100,
      child: Card(
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              scramble ?? 'Select something to mašinka on',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
