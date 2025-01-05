import 'package:flutter/material.dart';

class SnackBarHandler {
  static final SnackBarHandler _instance = SnackBarHandler._internal();

  SnackBarHandler._internal();

  factory SnackBarHandler() => _instance;

  void karaMessage(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(
      SnackBar(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.only(bottom: 20),
        content: Center(
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                  child: Image.asset('images/kara.png'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
