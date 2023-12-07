import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class FeedMoreText extends StatelessWidget {
  const FeedMoreText({
    super.key,
    required this.text,
    this.textColor = Colors.black,
  });

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(Sizes.size16),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
