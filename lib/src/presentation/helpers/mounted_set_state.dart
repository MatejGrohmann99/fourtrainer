import 'package:flutter/material.dart';

extension MountedSetState<T extends StatefulWidget> on State<T> {
  void mountedSetState(VoidCallback fn) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(fn);
    }
  }
}
