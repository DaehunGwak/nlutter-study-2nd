import '../utils/image_url.dart';

class SimpleMovie {
  final int id;
  final String title;
  final String? backdropImageUrl;
  final String? posterImageUrl;

  SimpleMovie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        backdropImageUrl = ImageUrlUtils.getFullImageUrl(json['backdrop_path']),
        posterImageUrl = ImageUrlUtils.getFullImageUrl(json['poster_path']);

  String? get imageUrl => backdropImageUrl ?? posterImageUrl;

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
        backdropImageUrl = ImageUrlUtils.getFullImageUrl(json['backdrop_path']),
        posterImageUrl = ImageUrlUtils.getFullImageUrl(json['poster_path']);

  String? get imageUrl => backdropImageUrl ?? posterImageUrl;

  @override
  String toString() {
    return 'DetailMovie{id: $id, title: $title, overview: $overview, runtime: $runtime, voteAverage: $voteAverage, genres: $genres, backdropImageUrl: $backdropImageUrl, posterImageUrl: $posterImageUrl}';
  }
}
