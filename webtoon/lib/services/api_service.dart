import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon.dart';

class ApiService {
  static const String _baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String _todayPath = "today";

  static Future<List<WebtoonTodayModel>> getTodayToons() async {
    final url = Uri.parse('$_baseUrl/$_todayPath');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('비정상적인 응답: ${response.statusCode}');
    }

    final List<dynamic> webtoons = jsonDecode(response.body);
    return webtoons.map((e) => WebtoonTodayModel.fromJson(e)).toList();
  }
}
