import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/timeline/models/feed.dart';

import 'feed_images_widget.dart';
import 'feed_reply_avatars.dart';
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
        top: Sizes.size16,
        bottom: Sizes.size16,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.h16,
              Column(
                // LEFT SIDE
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FeedTopWidget(feed: feed),
                      Gaps.v3,
                      Padding(
                        padding: const EdgeInsets.only(right: Sizes.size24),
                        child: Text(
                          feed.contentDescription,
                          style: const TextStyle(fontSize: Sizes.size16),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
          if (feed.contentImageUrls.isNotEmpty) Gaps.v12,
          if (feed.contentImageUrls.isNotEmpty) FeedImagesWidget(feed: feed),
          const Row(
            children: [
              Gaps.h80,
              Column(children: [
                Gaps.v16,
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.heart),
                    Gaps.h16,
                    FaIcon(FontAwesomeIcons.comment),
                    Gaps.h16,
                    FaIcon(FontAwesomeIcons.rotate),
                    Gaps.h16,
                    FaIcon(FontAwesomeIcons.paperPlane),
                  ],
                ),
              ],)
            ],
          ),
          Gaps.v12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.h16,
              FeedReplyAvatars(feed: feed),
              Gaps.h8,
              Text(
                "${feed.replyCount} replies﹒${feed.likeCount} likes",
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
