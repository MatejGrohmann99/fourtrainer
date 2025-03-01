import 'package:flutter/material.dart';
import 'package:fourtrainer/features/poll_discover/poll_view.dart';

import 'filter/ll_alg_filter.dart';

class POllDiscoverPage extends StatelessWidget {
  const POllDiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final map = getAlgsFromRawInput();

    return Scaffold(
      body: PollView(map: map),
    );
  }
}
