import 'package:flutter/material.dart';

import 'widgets/feed_widget.dart';
import 'models/feed.dart';
import 'models/mock/feed_mock_util.dart';

// NEW: stateless widget 으로 구성하면 계속 Offstage 를 써도 계속 반복해서 위젯을 생성하는 현상 발생
// 따라서, StatefulWidget 으로 전환한 후 const 로 생성할 수 있도록 변경
// TODO: 왜 const 로 구성하지 않으면 계속 rebuild 될까?
class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  List<Feed> _feeds = [];

  @override
  void initState() {
    _feeds = FeedMockUtil.getMockFeeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build timeline');
    return CustomScrollView(
      slivers: [
        SliverList(
          // NEW: ListView.builder 대체 가능, TODO: sliver 란?
          delegate: SliverChildBuilderDelegate(
            childCount: _feeds.length,
            (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FeedWidget(feed: _feeds.elementAt(index)),
                const Divider(
                  thickness: 0.2,
                  height: 1,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
