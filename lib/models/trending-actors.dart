// To parse this JSON data, do
//
//     final trendingActors = trendingActorsFromJson(jsonString);

import 'dart:convert';

TrendingActors trendingActorsFromJson(String str) =>
    TrendingActors.fromJson(json.decode(str));

String trendingActorsToJson(TrendingActors data) => json.encode(data.toJson());

class TrendingActors {
  String name;
  String profilePath;

  TrendingActors({
    required this.name,
    required this.profilePath,
  });

  factory TrendingActors.fromJson(Map<String, dynamic> json) => TrendingActors(
        name: json["name"],
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile_path": profilePath,
      };
}
