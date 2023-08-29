// To parse this JSON data, do
//
//     final movieActorsById = movieActorsByIdFromJson(jsonString);

import 'dart:convert';

MovieActorsById movieActorsByIdFromJson(String str) =>
    MovieActorsById.fromJson(json.decode(str));

String movieActorsByIdToJson(MovieActorsById data) =>
    json.encode(data.toJson());

class MovieActorsById {
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  String? profilePath;
  String? character;
  String? creditId;
  int? order;

  MovieActorsById({
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.profilePath,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory MovieActorsById.fromJson(Map<String, dynamic> json) =>
      MovieActorsById(
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        profilePath: json["profile_path"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "profile_path": profilePath,
        "character": character,
        "credit_id": creditId,
        "order": order,
      };
}
