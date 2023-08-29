import '../models/search-results.dart';
import 'package:netflix/widgets/costants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchResultsAPI {
  final String? string_query;
  SearchResultsAPI({required this.string_query});

  getSearch_URL() {
    final String search_url =
        "https://api.themoviedb.org/3/search/movie?query=$string_query&api_key=${Constants.apiKey}";

    return search_url;
  }

  Future<List<SearchResults>> getSearchResults() async {
    final response = await http.get(Uri.parse(getSearch_URL()));
    if (response.statusCode ==
        200) // if everything is fine then we want to decode our json
    {
      final decodedData = json.decode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData.map((movie) => SearchResults.fromJson(movie)).toList();
    } else {
      throw Exception(("Something Happend !"));
    }
  }
}
