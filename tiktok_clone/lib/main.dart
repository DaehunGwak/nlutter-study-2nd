import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

import 'features/main/navigation/main_navigation_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white, // NEW
        appBarTheme: const AppBarTheme( // NEW
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color(0xFFE9435A),
          background: Colors.white,
          primary: const Color(0xFFE9435A),
        ),
        textSelectionTheme: const TextSelectionThemeData( // NEW: 전체 text input 테마에 적용
          cursorColor: Color(0xFFE9435A),
        )
      ),
      // home: SignUpScreen(),
      // home: InterestsScreen(),
      home: const MainNavigationScreen(),
    );
  }
}
