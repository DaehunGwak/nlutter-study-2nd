import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key}); // TODO: NEW: key의 역할: 고유하게 지정하면 새로운 위젯으로 취급, 따로 지정하지 않으면 같은 위젯으로 취급될 수 있음

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  _increase() {
    setState(() {
      _clicks++;
    });
  }

  @override
  void dispose() {
    print(_clicks);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_clicks',
            style: TextStyle(fontSize: Sizes.size32),
          ),
          TextButton(
            onPressed: _increase,
            child: const Text(
              '+',
              style: TextStyle(fontSize: Sizes.size32),
            ),
          ),
        ],
      ),
    );
  }
}
