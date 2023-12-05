import 'package:flutter/material.dart';
import 'package:thread_clone/timeline/models/feed.dart';
import 'package:thread_clone/timeline/models/mock/feed_mock_util.dart';

import 'models/widgets/profile_avatar.dart';

class TimelineScreen extends StatelessWidget {
  final List<Feed> feeds = FeedMockUtil.getMockFeeds();

  TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: feeds.length,
        itemBuilder: (context, index) {
          final feed = feeds.elementAt(index);
          return Row(
            children: [
              ProfileAvatar(
                imageUrl: feed.createdUser.profileImageUrl,
              ),
              Text(feed.createdUser.nickname),
            ],
          );
        },
      ),
    );
  }
}
