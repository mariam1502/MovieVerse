import 'dart:convert';

UpComing upComingFromJson(String str) => UpComing.fromJson(json.decode(str));

String upComingToJson(UpComing data) => json.encode(data.toJson());

class UpComing {
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  dynamic releaseDate;
  String original_title;
  dynamic vote_average;

  UpComing({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.original_title,
    required this.vote_average,
  });

  factory UpComing.fromJson(Map<String, dynamic> json) => UpComing(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        original_title: json["title"],
        vote_average: json["vote_average"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": original_title,
        "vote_average": vote_average,
      };
}
