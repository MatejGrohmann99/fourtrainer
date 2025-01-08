import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DialogHandler {
  static final DialogHandler _instance = DialogHandler._();

  DialogHandler._();

  factory DialogHandler() => _instance;

  bool isDialogOpened = false;

  Future<T> _guardCallback<T>(Future<T?> Function() callback, T fallback) async {
    try {
      isDialogOpened = true;
      final result = await callback();
      isDialogOpened = false;
      return result ?? fallback;
    } catch (_) {}
    return fallback;
  }

  Future<bool> yuSureDu(BuildContext context, {String? message}) => _guardCallback(
        () async => showDialog<bool>(
          context: context,
          builder: (context) {
            return _DialogKeyboardListener(
              dialog: AlertDialog(
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
              ),
            );
          },
        ),
        false,
      );

  void optionDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) =>
      _guardCallback(
        () => showDialog<bool>(
          context: context,
          builder: (context) {
            return _DialogKeyboardListener(
              onCancel: onCancel,
              onConfirm: onConfirm,
              dialog: AlertDialog(
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
              ),
            );
          },
        ),
        null,
      );
}

class _DialogKeyboardListener extends StatelessWidget {
  const _DialogKeyboardListener({required this.dialog, this.onCancel, this.onConfirm, super.key});

  final Widget dialog;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DialogKeyboardController>(
      init: DialogKeyboardController(onCancel, onConfirm),
      builder: (controller) => KeyboardListener(
        focusNode: controller.focusNode,
        onKeyEvent: (event) => controller.onKeyEvent(event, context),
        child: dialog,
      ),
    );
  }
}

class DialogKeyboardController extends GetxController {
  static DialogKeyboardController get to => Get.find();

  DialogKeyboardController(this.onCancel, this.onConfirm);

  final focusNode = FocusNode();
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  @override
  void onReady() {
    super.onReady();
    focusNode.requestFocus();
  }

  @override
  void onClose() {
    focusNode.dispose();
    super.onClose();
  }

  void onKeyEvent(
    KeyEvent value,
    BuildContext context,
  ) {

    if (value is KeyDownEvent) return;
    if (value.logicalKey == LogicalKeyboardKey.enter) {
      onConfirm?.call();
      if (Navigator.canPop(context)) {
      return Navigator.pop(context, true);
      }
    } else if (value.logicalKey == LogicalKeyboardKey.escape) {
      onCancel?.call();
      if (Navigator.canPop(context)) {
      return Navigator.pop(context, false);
    }}
  }
}
