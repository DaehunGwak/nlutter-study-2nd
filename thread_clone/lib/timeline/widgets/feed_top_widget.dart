import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../models/feed.dart';

class FeedTopWidget extends StatelessWidget {
  const FeedTopWidget({
    super.key,
    required this.feed,
  });

  final Feed feed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          feed.createdUser.nickname,
          style: const TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Text(
              feed.formattedPassedTime,
              style: const TextStyle(
                fontSize: Sizes.size14,
                color: Colors.grey,
              ),
            ),
            Gaps.h12,
            const FaIcon(
              FontAwesomeIcons.ellipsis,
              size: Sizes.size20,
            ),
            Gaps.h24,
          ],
        )
      ],
    );
  }
}
