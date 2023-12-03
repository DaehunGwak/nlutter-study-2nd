import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/gaps.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String _text;
  final FaIcon? _icon;
  final Color _backgroundColor;
  final Color _fontColor;

  const AuthButton({
    super.key,
    required String text,
    FaIcon? icon,
    Color backgroundColor = Colors.white,
    Color fontColor = Colors.black,
  })  : _fontColor = fontColor,
        _backgroundColor = backgroundColor,
        _icon = icon,
        _text = text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // 부모크기에 맞춰 사이즈 지정 가능
      widthFactor: 1.0,
      child: Container(
        padding: const EdgeInsets.all(Sizes.size16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size2,
          ),
          borderRadius: BorderRadius.circular(Sizes.size64),
          color: _backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_icon != null) _icon!,
            if (_icon != null) Gaps.h10,
            Text(
              _text,
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w800,
                color: _fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
