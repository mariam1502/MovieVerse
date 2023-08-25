// To parse this JSON data, do
//
//     final movieGenre = movieGenreFromJson(jsonString);

import 'dart:convert';

MovieGenre movieGenreFromJson(String str) =>
    MovieGenre.fromJson(json.decode(str));

String movieGenreToJson(MovieGenre data) => json.encode(data.toJson());

class MovieGenre {
  int id;
  String name;

  MovieGenre({
    required this.id,
    required this.name,
  });

  factory MovieGenre.fromJson(Map<String, dynamic> json) => MovieGenre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
