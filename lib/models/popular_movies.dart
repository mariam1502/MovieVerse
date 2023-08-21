class PopularMovie {
  String backdrop_path;
  String? original_language;
  String? original_title;
  String? overview;
  String? poster_path;
  String? release_date;
  dynamic? vote_average;
  int? id;
  String? tite;

  PopularMovie(
      {required this.backdrop_path,
      required this.original_title,
      required this.overview,
      required this.poster_path,
      required this.release_date,
      required this.vote_average,
      required this.tite,
      required this.id});

  factory PopularMovie.fromJson(Map<String, dynamic> json) {
    return PopularMovie(
        backdrop_path: json['backdrop_path'],
        original_title: json['original_title'],
        overview: json['overview'],
        poster_path: json['poster_path'],
        release_date: json['release_date'],
        vote_average: json['vote_average'],
        tite: json['tite'],
        id: json['id']);
  }

// "Arrow Function" syntax, you're using a single expression
// that directly returns the value of the map.
  Map<String, dynamic> toJson() => {
        "backdrop_path": backdrop_path,
        'original_title': original_title,
        'overview': overview,
        'poster_path': poster_path,
        'release_date': release_date,
        'vote_average': vote_average,
        'tite': tite,
        'id': id
      };
}
