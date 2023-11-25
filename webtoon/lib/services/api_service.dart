import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon.dart';

class ApiService {
  static const String _baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String _todayPath = "today";
  static const String _episodesPath = "episodes";

  static Future<List<WebtoonTodayModel>> getTodayToons() async {
    final url = Uri.parse('$_baseUrl/$_todayPath');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('비정상적인 응답: ${response.statusCode}');
    }

    print(response.body);
    final List<dynamic> webtoons = jsonDecode(response.body);
    return webtoons.map((e) => WebtoonTodayModel.fromJson(e)).toList();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$_baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('비정상적인 응답: ${response.statusCode}');
    }

    print(response.body);
    return WebtoonDetailModel.fromJson(jsonDecode(response.body));
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(String id) async  {
    final url = Uri.parse('$_baseUrl/$id/$_episodesPath');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('비정상적인 응답: ${response.statusCode}');
    }

    print(response.body);
    final List<dynamic> episodes = jsonDecode(response.body);
    return episodes.map((e) => WebtoonEpisodeModel.fromJson(e)).toList();
  }
}
