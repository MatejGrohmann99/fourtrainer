import 'package:flutter/material.dart';
import 'package:revenge_cube/revenge_cube.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageGenView(),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 18,
        children: [
          Text('Enter your algorithm below:'),
          TextField(
            controller: inputFieldController,
            decoration: const InputDecoration(
              labelText: 'Enter your algorithm here',
            ),
            onChanged: _onChanged,
          ),
          Text('ParsedValue: $algorithmParsed'),
          Text('InverseValue: ${RevengeMove.invertAlgorithm(algorithmParsed)}'),
          RevengeImageBuilder(
            moves: algorithmParsed,
            inverse: true,
          ),
        ],
      ),
    );
  }

  void _onChanged(String value) {
    algorithmParsed = RevengeMove.parseLine(value) ?? [];
    setState(() {});
  }
}
