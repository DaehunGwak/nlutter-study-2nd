import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/util/mock_util.dart';

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

  static final imageUrls = [
    for (int i = 0; i < 20; i++)
      MockUtils.getMockImageUrl(width: 500, height: 300 * 16 ~/ 9)
  ];
  static final profileImageUrls = [
    for (int i = 0; i < 20; i++)
      MockUtils.getMockProfileImageUrl(width: 30, height: 30)
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
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(Sizes.size10),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 16,
                    child: Container(
                      // NEW: FadeInImage 를 이용해서 기본 이미지를 지정하고 후에 로딩되면 페이드인 되도록
                      // 구성하는 위젯, 하지만 여기서 사용 안할거임
                      color: Colors.grey.shade400,
                      child: Image.network(
                        imageUrls.elementAt(index),
                        fit: BoxFit.cover, // NEW: 부모 위젯의 사이즈에 어떻게 피팅할것인가? 를 지정
                      ),
                    ),
                  ),
                  Gaps.v10,
                  const Text(
                    'this is a very long caption for my tiktok that im upload'
                    'just now currently.',
                    maxLines: 2, // NEW
                    overflow: TextOverflow.ellipsis, // NEW
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v6,
                  DefaultTextStyle( // NEW
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size14,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: Sizes.size14,
                          backgroundColor: Colors.grey.shade400,
                          foregroundImage: NetworkImage(
                            profileImageUrls.elementAt(index),
                          ),
                        ),
                        Gaps.h4,
                        const Expanded(
                          child: Text(
                            "my name is ver long alalallll",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h4,
                        const FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size16,
                          color: Colors.grey,
                        ),
                        Gaps.h2,
                        const Text(
                          '2.5M',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: Sizes.size28),
                ),
              )
          ],
        ),
      ),
    );
  }
}
