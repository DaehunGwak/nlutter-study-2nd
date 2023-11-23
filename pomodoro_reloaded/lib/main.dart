import 'package:flutter/material.dart';
import 'package:pomodoro_reloaded/widgets/pomodoro_body.dart';

void main() {
  runApp(const PomodoroReloadedApp());
}

class PomodoroReloadedApp extends StatelessWidget {
  const PomodoroReloadedApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFFE64D3D),
      background: const Color(0xFFE64D3D),
      primary: Colors.white,
    );

    return MaterialApp(
      title: 'Pomodoro Reloaded!',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: buildPomodoroAppBar(colorScheme),
          body: PomodoroBody(),
      ),
    );
  }

  AppBar buildPomodoroAppBar(ColorScheme colorScheme) {
    return AppBar(
      backgroundColor: colorScheme.background,
      shadowColor: Colors.transparent,
      title: const Row(
        children: [
          SizedBox(width: 15),
          Text("POMOTIMER",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}


