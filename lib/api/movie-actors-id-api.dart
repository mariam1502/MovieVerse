import '../models/movie-actors-id.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:netflix/widgets/costants.dart';

class MovieActorsApi {
  final int? id;
  MovieActorsApi({required this.id});

  getMovieActors_Data_URL() {
    final String movie_actors_URL =
        "https://api.themoviedb.org/3/movie/$id/credits?language=en-US&api_key=${Constants.apiKey}";

    return movie_actors_URL;
  }

  Future<List<MovieActorsById>> getMovieActors() async {
    final response = await http.get(Uri.parse(getMovieActors_Data_URL()));
    if (response.statusCode ==
        200) // if everything is fine then we want to decode our json
    {
      final decodedData = json.decode(response.body)['cast'] as List;
      print(decodedData);
      return decodedData
          .map((movie) => MovieActorsById.fromJson(movie))
          .toList();
    } else {
      throw Exception(("Something Happend !"));
    }
  }
}
