class PopularMovie {
  String backdrop_path;
  String? original_language;
  String? original_title;
  String? overview;
  String? poster_path;
  String? release_date;
  dynamic? vote_average;
  String? tite;

  PopularMovie({
    required this.backdrop_path,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.vote_average,
    required this.tite,
  });

  factory PopularMovie.fromJson(Map<String, dynamic> json) {
    return PopularMovie(
        backdrop_path: json['backdrop_path'],
        original_title: json['original_title'],
        overview: json['overview'],
        poster_path: json['poster_path'],
        release_date: json['release_date'],
        vote_average: json['vote_average'],
        tite: json['tite']);
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
        'tite': tite
      };
}

// "backdrop_path": "/4HodYYKEIsGOdinkGi2Ucz6X9i0.jpg",
// "genre_ids": [
// 16,
// 28,
// 12,
// 878
// ],
// "id": 569094,
// "original_language": "en",
// "original_title": "Spider-Man: Across the Spider-Verse",
// "overview": "After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.",
// "poster_path": "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
// "release_date": "2023-05-31",
// "vote_average": 8.5,
