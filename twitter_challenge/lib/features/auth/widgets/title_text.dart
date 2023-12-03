import 'package:flutter/material.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class AuthTitleText extends StatelessWidget {
  final String title;

  const AuthTitleText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: Sizes.size28,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
      ),
    );
  }
}
