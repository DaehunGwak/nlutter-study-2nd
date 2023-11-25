import 'package:flutter_test/flutter_test.dart';
import 'package:webtoon/services/api_service.dart';

void main() {
  test('today 웹툰 api 작동 테스트', () async {
    final response = await ApiService.getTodayToons();

    response.forEach((element) => print(element));

    expect(response.length > 1, true);
  });

  test('detail 웹툰 api 작동 테스트', () async {
    final response = await ApiService.getToonById('787061');

    print(response);

    expect(response.title, '소공녀 민트');
  });

  test('특정 웹툰 episodes api 작동 테스트', () async {
    final response = await ApiService.getLatestEpisodesById('787061');

    print(response);

    expect(response.length >= 5, true);
  });
}