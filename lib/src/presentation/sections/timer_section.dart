import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../state.dart';

class TimerSection extends StatefulWidget {
  const TimerSection({required this.lastTime, required this.isTimerRunning, super.key});

  final SessionTime? lastTime;
  final bool isTimerRunning;

  @override
  State<TimerSection> createState() => _TimerSectionState();
}

class _TimerSectionState extends State<TimerSection> {
  Timer? timer;
  double count = 0;

  @override
  initState() {
    super.initState();
    setup(widget.lastTime, widget.isTimerRunning);
  }

  @override
  didUpdateWidget(TimerSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lastTime != widget.lastTime || oldWidget.isTimerRunning != widget.isTimerRunning) {
      setup(widget.lastTime, widget.isTimerRunning);
    }
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
  }

  void setup(SessionTime? lastTime, bool isTimerRunning) {
    if (isTimerRunning) {
      timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          count += 0.01;
        });
      });
    } else {
      timer?.cancel();
      count = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayText = timer?.isActive ?? false ? count.toStringAsFixed(2) : widget.lastTime?.toString() ?? '';
    final turtleProgress = (count < 5 ? 0 : (sin(count) * 20 + 20).round()).toInt();
    final turtleStart = List.filled(40 - turtleProgress, ' ').join();
    final turtleEnd = List.filled(turtleProgress, ' ').join();
    final secondaryWidget = timer?.isActive ?? false
        ? count > 5
            ? Text(
                '$turtleStart🐢$turtleEnd',
                style: Theme.of(context).textTheme.displayLarge,
              )
            : null
        : Text(
            'Press SPACE to start',
            style: Theme.of(context).textTheme.labelLarge,
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          displayText,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 150,
          child: secondaryWidget ?? const SizedBox.expand(),
        ),
      ],
    );
  }
}
