import 'package:thread_clone/timeline/models/feed.dart';
import 'package:faker/faker.dart';
import 'package:thread_clone/timeline/models/user.dart';

class FeedMockUtil {
  FeedMockUtil._();

  static List<Feed> getMockFeeds() {
    final List<Feed> feeds = [];
    final faker = Faker();
    final nowDateTime = DateTime.now();

    for (int i = 0; i < 40; i++) {
      feeds.add(
        Feed(
          createdUser: User(
            nickname: faker.internet.userName(),
            profileImageUrl: _profileImageUrl(faker),
            confirmed: (i % 2 == 0) ? false : true,
          ),
          contentDescription: faker.lorem.sentence(),
          createdDateTime: nowDateTime.subtract(Duration(minutes: 2 + i * 41)),
        ),
      );
    }

    return feeds;
  }

  static String _profileImageUrl(Faker faker) {
    return faker.image.image(
      height: 50,
      width: 50,
      keywords: ['avatar', 'person', 'big_logo'],
      random: true,
    );
  }
}
