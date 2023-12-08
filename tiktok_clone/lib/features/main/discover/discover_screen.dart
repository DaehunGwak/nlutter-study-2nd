import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  final tabs = const [
    'Top',
    'Users',
    'Videos',
    'Sounds',
    'LIVE',
    'Shopping',
    'Brands'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text('Discover'),
          // NEW: PreferredSizedWidget: 해당 위젯은 특정한 사이즈를 가지려 하지만
          // 자식 위젯은 부모요소의 사이즈 제한을 받지 않음
          bottom: TabBar(
            // NEW: TabBar 는 controller 를 필요로 하므로 지금여기선 DefaultTabController 로 감싸기로 한다
            isScrollable: true,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            splashFactory: NoSplash.splashFactory,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Colors.black,
            tabs: [
              for (var tab in tabs)
                Tab(text: tab,)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var tab in tabs)
              Center(
                child: Text(tab, style: TextStyle(fontSize: Sizes.size28),),
              )
          ],
        ),
      ),
    );
  }
}
