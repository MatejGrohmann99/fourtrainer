import 'package:flutter/material.dart';
import 'package:revenge_cube/revenge_cube.dart';

class PollView extends StatefulWidget {
  const PollView({required this.map, super.key});

  final Map<List<List<Sticker?>>, List<List<RevengeMove>>> map;

  @override
  State<PollView> createState() => _PollViewState();
}

class _PollViewState extends State<PollView> {
  get entries => widget.map.entries;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final entry = entries.elementAt(selectedIndex);
    return Column(
      children: [
        if (selectedIndex < entries.length - 1)
          OutlinedButton(
            onPressed: () {
              setState(() {
                selectedIndex = selectedIndex + 1;
              });
            },
            child: const Text('Next'),
          ),
        if (selectedIndex > 0)
          OutlinedButton(
            onPressed: () {
              setState(() {
                selectedIndex = selectedIndex - 1;
              });
            },
            child: const Text('Previous'),
          ),
        Text('CASE NUMBER ${selectedIndex + 1}'),
        RevengeCubeWidget(
          gridColorsOverride: entry.key,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                final alg = entry.value[index];
                return Text(
                  '${alg.map((e) => e.value).join(' ')} [${alg.length}]',
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: entry.value.length),
        ),
      ],
    );
  }
}
