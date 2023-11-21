import 'package:flutter/material.dart';
import 'package:ui_clone/date_bar.dart';
import 'package:ui_clone/profile_bar.dart';

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
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 15),
          titleMedium: TextStyle(fontSize: 42),
        )
      ),
      home: const Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 70),
              ScheduleProfileBar(),
              SizedBox(height: 30),
              SideScrollDateBar(),
            ],
          ),
        ),
      ),
    );
  }
}
