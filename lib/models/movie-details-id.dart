// To parse this JSON data, do
//
//     final movieId = movieIdFromJson(jsonString);

import 'dart:convert';

MovieId movieIdFromJson(String str) => MovieId.fromJson(json.decode(str));

class MovieId {
  String backdropPath;
  List<Genre> genres;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  DateTime releaseDate;
  int runtime;
  String status;
  String title;
  double voteAverage;
  int voteCount;

  MovieId({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.status,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieId.fromJson(Map<String, dynamic> json) => MovieId(
        backdropPath: json["backdrop_path"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        runtime: json["runtime"],
        status: json["status"],
        title: json["title"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );
}
