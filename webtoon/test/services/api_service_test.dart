import 'package:flutter_test/flutter_test.dart';
import 'package:webtoon/services/api_service.dart';

void main() {
  test('today 웹툰 api 작동 테스트', () async {
    final response = await ApiService.getTodayToons();

    response.forEach((element) => print(element));

    expect(response.length > 1, true);
  });
}