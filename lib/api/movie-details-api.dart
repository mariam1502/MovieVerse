import 'dart:convert';
import 'package:netflix/widgets/costants.dart';
import 'package:http/http.dart' as http;
import '../models/movie-details-id.dart';

class MovieDetailsId_API {
  final int? id;
  MovieDetailsId_API({required this.id});

  getMovieDetails_Data_URL() {
    final String movie_details_URL =
        "https://api.themoviedb.org/3/movie/$id?language=en-US&api_key=${Constants.apiKey}";
    return movie_details_URL;
  }

  Future<MovieId> getMoviesDetailsData() async {
    final response = await http.get(Uri.parse(getMovieDetails_Data_URL()));
    if (response.statusCode ==
        200) // if everything is fine then we want to decode our json
    {
      final decodedData = json.decode(response.body);
      print(decodedData);
      return MovieId.fromJson(decodedData);
    } else {
      throw Exception(("Something hello !"));
    }
  }
}
