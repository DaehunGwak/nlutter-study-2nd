import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

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
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color(0xFFE9435A),
          primary: const Color(0xFFE9435A),
        ),
        useMaterial3: true,
      ),
      home: Container(
        padding: const EdgeInsets.all(Sizes.size16),
        child: const Row(
          children: [
            Gaps.h20,
            Text('hello'),
          ],
        ),
      ),
    );
  }
}
