import 'package:thread_clone/timeline/models/feed.dart';
import 'package:faker/faker.dart';
import 'package:thread_clone/timeline/models/user.dart';

class FeedMockUtil {
  FeedMockUtil._();

  static List<Feed> getMockFeeds() {
    final List<Feed> feeds = [];
    final faker = Faker();
    final nowDateTime = DateTime.now();

    feeds.add(
      Feed(
        createdUser: User(
          nickname: "daehun_gwak",
          profileImageUrl: _profileImageUrl(faker),
          confirmed: true,
        ),
        contentDescription: "살려줘 🫠",
        createdDateTime: nowDateTime,
      ),
    );

    for (int i = 0; i < 40; i++) {
      feeds.add(
        Feed(
          createdUser: User(
            nickname: faker.internet.userName(),
            profileImageUrl: _profileImageUrl(faker),
            confirmed: (i % 2 == 0) ? false : true,
          ),
          contentImageUrls: [
            if (i % 3 == 0)
              for (int j = 0; j < 3; j++)
                _contentImageUrl(faker)
          ],
          contentDescription: faker.lorem.sentence(),
          createdDateTime: nowDateTime.subtract(Duration(minutes: 2 + i * 41)),
          replyCount: random.integer(100),
          likeCount: random.integer(1000),
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

  // https://source.unsplash.com/840x640?keywords=nature,background,art&random=51
  static String _contentImageUrl(Faker faker) {
    return faker.image.image(
      height: 210,
      width: 280,
      keywords: ['nature', 'background', 'art'],
      random: true,
    );
  }
}
