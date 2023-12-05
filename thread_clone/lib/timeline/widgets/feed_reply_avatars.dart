import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/feed.dart';
import '../../constants/sizes.dart';

class FeedReplyAvatars extends StatelessWidget {
  final Feed feed;

  const FeedReplyAvatars({
    super.key,
    required this.feed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: 58,
          height: 42,
        ),
        if (feed.replyCount == 1) _buildCircleAvatars1(),
        if (feed.replyCount == 2) _buildCircleAvatars2(),
        if (feed.replyCount >= 3) _buildCircleAvatars3(),
      ],
    );
  }

  Widget _buildCircleAvatars1() {
    return SizedBox(
      width: 58,
      height: 42,
      child: Center(
        child: _buildCircleAvatar(
          size: Sizes.size12,
          imageUrl: feed.replyCandidateUsers.elementAt(0).profileImageUrl,
        ),
      ),
    );
  }

  Widget _buildCircleAvatars2() {
    return SizedBox(
      width: 58,
      height: 42,
      child: Center(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(-5, 4),
              child: _buildCircleAvatar(
                size: Sizes.size12,
                imageUrl: feed.replyCandidateUsers.elementAt(0).profileImageUrl,
              ),
            ),
            Transform.translate(
              offset: const Offset(10, 0),
              child: CircleAvatar(
                radius: Sizes.size16,
                backgroundColor: Colors.white,
                child: _buildCircleAvatar(
                  size: Sizes.size12,
                  imageUrl: feed.replyCandidateUsers.elementAt(1).profileImageUrl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAvatars3() {
    return SizedBox(
      width: 58,
      height: 42,
      child: Center(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(14, -10),
              child: _buildCircleAvatar(
                size: 13,
                imageUrl: feed.replyCandidateUsers.elementAt(0).profileImageUrl,
              ),
            ),
            Transform.translate(
              offset: const Offset(-14, 0),
              child: _buildCircleAvatar(
                size: Sizes.size10,
                imageUrl: feed.replyCandidateUsers.elementAt(1).profileImageUrl,
              ),
            ),
            Transform.translate(
              offset: const Offset(8, 20),
              child: _buildCircleAvatar(
                size: Sizes.size8,
                imageUrl: feed.replyCandidateUsers.elementAt(2).profileImageUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }

  CircleAvatar _buildCircleAvatar({
    required double size,
    required String imageUrl,
  }) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Colors.grey,
      foregroundImage: NetworkImage(imageUrl),
      child: const FaIcon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
    );
  }
}
