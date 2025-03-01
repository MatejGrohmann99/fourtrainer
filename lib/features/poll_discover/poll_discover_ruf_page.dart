import 'package:flutter/material.dart';
import 'package:fourtrainer/features/poll_discover/poll_view.dart';
import 'package:revenge_cube/revenge_cube.dart';

import 'filter/ll_alg_filter.dart';

class POllRUFDiscoverPage extends StatelessWidget {
  const POllRUFDiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final map = getAlgsFromRawInputRuf();

    return Scaffold(
      body: PollView(map: map),
    );
  }
}


