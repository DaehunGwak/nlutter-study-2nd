import 'package:flutter/material.dart';

void main() {
  runApp(const PomodoroReloadedApp());
}

class PomodoroReloadedApp extends StatelessWidget {
  const PomodoroReloadedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Reloaded!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE64D3D),
          background: const Color(0xFFE64D3D),
          primary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
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
          ),
          body: Column(
            children: [
              Flexible(
                child: Container(
                  color: Colors.blue,
                ),
              )
            ],
          )),
    );
  }
}
