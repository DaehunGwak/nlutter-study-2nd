import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/timeline/widgets/more/feed_more_text.dart';

class FeedMoreBottomSheet extends StatelessWidget {
  const FeedMoreBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.34,
      width: width,
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        children: [
          Gaps.v12,
          Container(
            height: Sizes.size5,
            width: Sizes.size48,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(Sizes.size32),
            ),
          ),
          Gaps.v16,
          FractionallySizedBox(
            widthFactor: 0.85,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeedMoreText(text: 'Unfollow'),
                  Divider(
                    thickness: 0.3,
                    height: 0.3,
                  ),
                  FeedMoreText(text: 'Mute'),
                ],
              ),
            ),
          ),
          Gaps.v20,
          FractionallySizedBox(
            widthFactor: 0.85,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeedMoreText(text: 'Hide'),
                  Divider(
                    thickness: 0.3,
                    height: 0.3,
                  ),
                  FeedMoreText(text: 'Report', textColor: Colors.red),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
