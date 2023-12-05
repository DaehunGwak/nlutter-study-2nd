import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/timeline/models/feed.dart';

import 'feed_top_widget.dart';
import 'profile_avatar.dart';

class FeedWidget extends StatelessWidget {
  final Feed feed;

  const FeedWidget({
    super.key,
    required this.feed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: Sizes.size16,
        top: Sizes.size16,
        bottom: Sizes.size16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            // LEFT SIDE
            children: [
              ProfileAvatar(
                imageUrl: feed.createdUser.profileImageUrl,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: Sizes.size8),
              child: Column(
                children: [
                  FeedTopWidget(feed: feed),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
