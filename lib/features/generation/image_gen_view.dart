import 'package:flutter/material.dart';
import 'package:revenge_cube/revenge_cube.dart';

class ImageGenPage extends StatelessWidget {
  const ImageGenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ImageGenView());
  }
}

class ImageGenView extends StatefulWidget {
  const ImageGenView({super.key});

  @override
  State<ImageGenView> createState() => _ImageGenViewState();
}

class _ImageGenViewState extends State<ImageGenView> {
  final inputFieldController = TextEditingController();

  var algorithmParsed = <RevengeMove>[];
  bool isOll = false;

  double size = 240;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 18,
        children: [
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
              child: ColoredBox(
                color: Colors.black,
                child: ProfessorCubeWidget(
                  width: size / 0.5,
                  height: size / 0.5,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: onScaleUp,
                  child: const Text('+'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: onScaleDown,
                  child: const Text('-'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _onChanged(String value) {
    algorithmParsed = RevengeMove.parseLine(value) ?? [];
    setState(() {});
  }

  void toggleOll(bool? value) {
    isOll = !isOll;
    setState(() {});
  }

  void onScaleDown() {
    size -= 5;
    setState(() {});
  }

  onScaleUp() {
    size += 5;
    setState(() {});
  }
}
