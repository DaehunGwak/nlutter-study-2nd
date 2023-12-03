import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialView extends StatelessWidget {
  final String title;
  final String description;

  const TutorialView({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v52,
          Text(
            title,
            style: const TextStyle(
              fontSize: Sizes.size40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.v16,
          Text(
            description,
            style: const TextStyle(
              fontSize: Sizes.size20,
            ),
          ),
        ],
      ),
    );
  }
}
