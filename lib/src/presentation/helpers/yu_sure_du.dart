import 'package:flutter/material.dart';

Future<bool> yuSureDu(BuildContext context) async =>
    await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Yu sure Du?'),
          content: SizedBox(
            width: 250,
            child: Image.asset('images/yu.png'),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Oke'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('NO'),
            ),
          ],
        );
      },
    ) ??
    false;
