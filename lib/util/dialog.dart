import 'package:flutter/material.dart';

class DialogHandler {
  static final DialogHandler _instance = DialogHandler._();

  DialogHandler._();

  factory DialogHandler() => _instance;

  Future<bool> yuSureDu(BuildContext context, {String? message}) async =>
      await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Yu sure Du?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset('images/yu.png'),
                ),
                if (message case final msg?) Text(msg)
              ],
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

  void optionDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) {
    showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: 300,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: Image.asset('images/kara.png'),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(
                  content,
                  maxLines: 4,
                ))
              ],
            ),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop(true);
              },
              child: const Text('Oke'),
            ),
            OutlinedButton(
              onPressed: () {
                onCancel();
                Navigator.of(context).pop(false);
              },
              child: const Text('NO'),
            ),
          ],
        );
      },
    );
  }
}
