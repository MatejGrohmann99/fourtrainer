// // import 'package:flutter/material.dart';
//
// class OverlayHandler {
//   static final OverlayHandler _instance = OverlayHandler._();
//
//   OverlayHandler._();
//
//   factory OverlayHandler() => _instance;
//
//   OverlayEntry? _overlayEntry;
//   VoidCallback? _onRemove;
//
//   void showOverlay(BuildContext context, Widget child, {VoidCallback? onInsert, VoidCallback? onRemove}) {
//     hideOverlay();
//     _onRemove = onRemove;
//     _overlayEntry = OverlayEntry(
//       builder: (context) => child,
//     );
//     if (Overlay.maybeOf(context) case final overlay?) {
//       overlay.insert(_overlayEntry!);
//       onInsert?.call();
//     }
//   }
//
//   void hideOverlay() {
//     _onRemove?.call();
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//     _onRemove = null;
//   }
// }
