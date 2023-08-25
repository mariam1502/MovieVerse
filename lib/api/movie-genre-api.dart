import 'dart:convert';
import 'package:netflix/widgets/costants.dart';
import 'package:http/http.dart' as http;
import '../models/movie-genre.dart';

class MovieGenreApi {
  static const _popularURL =
      "https://api.themoviedb.org/3/genre/movie/list?language=en&api_key=${Constants.apiKey}";

  Future<List<MovieGenre>> getGenreMovies() async {
    final response = await http.get(Uri.parse(_popularURL));
    if (response.statusCode ==
        200) // if everything is fine then we want to decode our json
    {
      final decodedData = json.decode(response.body)['genres'] as List;
      // print(decodedData);
      return decodedData.map((movie) => MovieGenre.fromJson(movie)).toList();
    } else {
      throw Exception(("Something Happend !"));
    }
  }
}
