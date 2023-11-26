import 'dart:math';

import '../utils/image_url.dart';

class SimpleMovie {
  final int id;
  final String title;
  final String? backdropImageUrl;
  final String? posterImageUrl;

  SimpleMovie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        backdropImageUrl = json['backdrop_path'],
        posterImageUrl = json['poster_path'];

  String? get imageUrl {
    return ImageUrlUtils.getImageUrl(backdropImageUrl ?? posterImageUrl);
  }

  String? get imageBigUrl {
    return ImageUrlUtils.getBigImageUrl(backdropImageUrl ?? posterImageUrl);
  }

  @override
  String toString() {
    return 'PopularMovie{id: $id, title: $title, backdropImageUrl: $backdropImageUrl, posterImageUrl: $posterImageUrl}';
  }
}

class DetailMovie {
  final int id;
  final String title;
  final String overview;
  final int runtime;
  final double voteAverage;
  final List<dynamic> genres;
  final String? backdropImageUrl;
  final String? posterImageUrl;

  DetailMovie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        runtime = json['runtime'],
        genres = (json['genres'] as List<dynamic>)
            .map((e) => e['name'].toString())
            .toList(),
        voteAverage = json['vote_average'],
        backdropImageUrl = ImageUrlUtils.getImageUrl(json['backdrop_path']),
        posterImageUrl = ImageUrlUtils.getImageUrl(json['poster_path']);

  String? get imageUrl => backdropImageUrl ?? posterImageUrl;

  String get formattedRuntime => '${runtime ~/ 60}h ${runtime % 60}m';

  String get formattedGenres => genres.getRange(0, min(3, genres.length)).join(', ');

  @override
  String toString() {
    return 'DetailMovie{id: $id, title: $title, overview: $overview, runtime: $runtime, voteAverage: $voteAverage, genres: $genres, backdropImageUrl: $backdropImageUrl, posterImageUrl: $posterImageUrl}';
  }
}
