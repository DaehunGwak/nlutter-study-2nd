import 'package:flutter/material.dart';
import 'package:twitter_challenge/features/auth/screens/auth_home_screen.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          background: Colors.white,
          primary: Colors.black,
          secondary: Colors.blue
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AuthHomeScreen(),
    );
  }
}
