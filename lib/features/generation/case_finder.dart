import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revenge_cube/revenge_cube.dart';

class CaseFinderPage extends StatelessWidget {
  const CaseFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ImageGenView());
  }
}

class ImageGenView extends StatefulWidget {
  const ImageGenView({super.key});

  @override
  State<ImageGenView> createState() => _CaseFinderPageState();
}

typedef Alg = (List<RevengeMove>, String);

class _CaseFinderPageState extends State<ImageGenView> {
  final inputFieldController = TextEditingController();
  final premove = TextEditingController();
  final node = FocusNode();

  var algorithmParsed = <RevengeMove>[];
  bool isOll = false;

  List<Alg> algs = [];

  double size = 240;

  @override
  void didChangeDependencies() {
    node.requestFocus();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: KeyboardListener(
        focusNode: node,
        onKeyEvent: onKeyEventHandler,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 18,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: onCapture,
                    child: const Text('Capture'),
                  ),
                  OutlinedButton(
                    onPressed: clear,
                    child: const Text('Clear'),
                  ),
                  OutlinedButton(
                    onPressed: onRemoveLast,
                    child: const Text('Remove last'),
                  ),
                ],
              ),
              TextField(
                controller: premove,
                decoration: const InputDecoration(
                  labelText: 'Enter your desired state here:',
                ),
                onChanged: _onChanged,
              ),
              const Text('Enter your algorithm below:'),
              TextField(
                controller: inputFieldController,
                decoration: const InputDecoration(
                  labelText: 'Enter your algorithm here',
                ),
                onChanged: _onChanged,
              ),
              CheckboxListTile(
                title: const Text('IGNORE SIDE COLORS'),
                onChanged: toggleOll,
                value: isOll,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SizedBox(
                  width: size,
                  height: size,
                  child: RevengeImageBuilder(
                    size: size / 0.5,
                    moves: algorithmParsed,
                    overrideSideColors: isOll,
                    inverse: true,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(children: [
                for (int index = 0; index < algs.length; index++)
                  () {
                    final item = algs[index];
                    final size = this.size / 1.5;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                          ),
                          child: SizedBox(
                            width: size,
                            height: size,
                            child: RevengeImageBuilder(
                              size: size / 0.5,
                              moves: item.$1,
                              overrideSideColors: isOll,
                              inverse: true,
                            ),
                          ),
                        ),
                        Text(item.$2),
                      ],
                    );
                  }(),
              ])
            ],
          ),
        ),
      ),
    );
  }

  void _onChanged(_) {
    final alg = RevengeMove.parseLine(inputFieldController.text) ?? [];
    final setup = RevengeMove.parseLine(premove.text) ?? [];
    final inverseSetup = RevengeMove.invertAlgorithm(setup);

    algorithmParsed = List.from(
      [
        ...alg,
        ...inverseSetup,
      ],
    );
    setState(() {});
  }

  void toggleOll(bool? value) {
    isOll = !isOll;
    setState(() {});
  }

  void onCapture() {
    final currentValue = inputFieldController.text;
    final currentAlg = algorithmParsed;
    final alg = (currentAlg, currentValue);
    algs.add(alg);
    setState(() {});
  }

  void clear() {
    algs.clear();
    setState(() {});
  }

  void onKeyEventHandler(KeyEvent value) {
    if (value is KeyDownEvent) {
      return;
    }

    if (value.logicalKey == LogicalKeyboardKey.enter) {
      onCapture();
    }
  }

  void onRemoveLast() {
    algs.removeLast();
    setState(() {});
  }
}
