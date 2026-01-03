import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revenge_cube/revenge_cube.dart';

class CaseSwitcher extends StatefulWidget {
  const CaseSwitcher({super.key});

  @override
  State<CaseSwitcher> createState() => _CaseSwitcherState();
}

class _CaseSwitcherState extends State<CaseSwitcher> {
  int currentIndex = 0;
  int currentCaseIndex = 0;

  late final List<RevengeCase> cases;
  late final List<int> caseIndices;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    cases = [
      ...RevengeCase.twoCycleCases,
      ...RevengeCase.topLayer3cycles,
      ...RevengeCase.twoTwoCycleCases,
      ...RevengeCase.topLayer4cycles
    ];
    caseIndices = [-1, 0, 1, 2, 3, 4, 5, 6, 7];

    // Request focus after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _nextCase() {
    setState(() {
      currentIndex = (currentIndex + 1) % cases.length;
    });
  }

  void _previousCase() {
    setState(() {
      currentIndex = (currentIndex - 1 + cases.length) % cases.length;
    });
  }

  void _nextCaseIndex() {
    setState(() {
      currentCaseIndex = (currentCaseIndex + 1) % caseIndices.length;
    });
  }

  void _previousCaseIndex() {
    setState(() {
      currentCaseIndex = (currentCaseIndex - 1 + caseIndices.length) % caseIndices.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentCase = cases[currentIndex];
    final actualCaseIndex = caseIndices[currentCaseIndex];

    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            _nextCase();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            _previousCase();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            _nextCaseIndex();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            _previousCaseIndex();
          }
        }
      },
      child: GestureDetector(
        onTap: () {
          _focusNode.requestFocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Case Switcher'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${currentCase.caseName} (index pyco $actualCaseIndex)',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 32),
                RevengeCubeWidget(
                  width: 300,
                  height: 300,
                  override: OverrideZmrd.indexujo(actualCaseIndex),
                  colors: currentCase.ui,
                ),
                const SizedBox(height: 32),
                Text(
                  'Case ${currentIndex + 1} of ${cases.length}, Index ${currentCaseIndex + 1} of ${caseIndices.length}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _previousCase,
                      icon: const Icon(Icons.arrow_back),
                      tooltip: 'Previous case (←)',
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: _nextCase,
                      icon: const Icon(Icons.arrow_forward),
                      tooltip: 'Next case (→)',
                    ),
                    const SizedBox(width: 32),
                    IconButton(
                      onPressed: _previousCaseIndex,
                      icon: const Icon(Icons.arrow_downward),
                      tooltip: 'Previous index (↓)',
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: _nextCaseIndex,
                      icon: const Icon(Icons.arrow_upward),
                      tooltip: 'Next index (↑)',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Click anywhere or use buttons to focus, then use arrow keys',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}