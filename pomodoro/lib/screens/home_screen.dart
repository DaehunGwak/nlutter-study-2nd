import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _initialTotalSeconds = 1500; // 25:00

  int _totalSeconds = _initialTotalSeconds;
  int _totalPomodoro = 0;
  bool _isRunning = false;
  late Timer _timer; // late: 나중에 반드시 초기화 될거야

  void _onTick(Timer timer) {
    if (_totalSeconds != 0) {
      setState(() => _totalSeconds--);
      return;
    }
    setState(() {
      _totalPomodoro++;
      _totalSeconds = _initialTotalSeconds;
      _isRunning = false;
    });
    _timer.cancel();
  }

  void _onStartPressed() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      _onTick,
    );
    setState(() {
      _isRunning = true;
    });
  }

  void _onPausePressed() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _onResetPressed() {
    if (_isRunning) {
      _timer.cancel();
    }
    setState(() {
      _totalSeconds = _initialTotalSeconds;
      _isRunning = false;
    });
  }

  String _formatTotalSeconds() {
    final duration = Duration(seconds: _totalSeconds);
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            // UI 기반 남은 공간만큼 펼쳐짐
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                _formatTotalSeconds(),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(_isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                    iconSize: 98,
                    color: Theme.of(context).cardColor,
                    onPressed: _isRunning ? _onPausePressed : _onStartPressed,
                  ),
                  TextButton(
                    onPressed: _onResetPressed,
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color),
                        ),
                        Text(
                          "$_totalPomodoro",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
