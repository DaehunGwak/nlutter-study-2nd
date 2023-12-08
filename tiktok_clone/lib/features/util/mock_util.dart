import 'package:faker/faker.dart';

class MockUtils {
  MockUtils._();

  static final _faker = Faker();

  static String getMockImageUrl({required int width, required int height,}) {
    return _faker.image.image(
      width: width,
      height: height,
      keywords: ['background', 'art', 'nature'],
      random: true,
    );
  }

  static String getMockProfileImageUrl({required int width, required int height,}) {
    return _faker.image.image(
      width: width,
      height: height,
      keywords: ['human', 'person', 'profile'],
      random: true,
    );
  }
}