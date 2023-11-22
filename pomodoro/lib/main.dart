import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_screen.dart';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clone Pomodoro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
          background: const Color(0xFF232323), // backgroundColor deprecated 대체
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            // headline1 deprecated 대체
            color: Color(0xFF232323),
          ),
        ),
        cardColor: Colors.orangeAccent,
      ),
      home: const HomeScreen(),
    );
  }
}
