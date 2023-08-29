// To parse this JSON data, do
//
//     final searchResults = searchResultsFromJson(jsonString);

import 'dart:convert';

SearchResults searchResultsFromJson(String str) =>
    SearchResults.fromJson(json.decode(str));

class SearchResults {
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? title;
  dynamic? voteAverage;
  dynamic? voteCount;

  SearchResults({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) => SearchResults(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        title: json["title"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
      );
}
