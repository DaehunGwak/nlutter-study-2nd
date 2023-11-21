import 'package:flutter/material.dart';
import 'package:ui_clone/widgets/date_bar.dart';
import 'package:ui_clone/widgets/profile_bar.dart';
import 'package:ui_clone/widgets/schedule_card.dart';

void main() {
  runApp(const ScheduleCloneApp());
}

/// flutter challenge 2기 - #9: UI clone
class ScheduleCloneApp extends StatelessWidget {
  const ScheduleCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.white,
          background: const Color(0xFF1F1F1F),
          primary: Colors.white,
          secondary: Colors.white60,
          tertiary: const Color(0xFF1F1F1F),

        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          titleMedium: TextStyle(fontSize: 44),
        )
      ),
      home: const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70),
              ScheduleProfileBar(),
              SizedBox(height: 30),
              SideScrollDateBar(),
              SizedBox(height: 40),
              ScheduleCardColumn(),
            ],
          ),
        ),
      ),
    );
  }
}
