import 'package:flutter/material.dart';
import 'package:thread_clone/navigation/main_navigation_screen.dart';

void main() {
  runApp(const ThreadCloneApp());
}

class ThreadCloneApp extends StatelessWidget {
  const ThreadCloneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          background: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}
