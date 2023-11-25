class WebtoonTodayModel {
  final String id;
  final String title;
  final String thumb;

  WebtoonTodayModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        thumb = json['thumb'];

  @override
  String toString() {
    return 'WebtoonTodayModel{id: $id, title: $title, thumb: $thumb}';
  }
}

class WebtoonDetailModel {
  final String title;
  final String about;
  final String genre;
  final String age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];

  @override
  String toString() {
    return 'WebtoonDetailModel{title: $title, about: $about, genre: $genre, age: $age}';
  }
}

class WebtoonEpisodeModel {
  final String thumb, id, title, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : thumb = json['thumb'],
        id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];

  @override
  String toString() {
    return 'WebtoonEpisodeModel{thumb: $thumb, id: $id, title: $title, rating: $rating, date: $date}';
  }
}
