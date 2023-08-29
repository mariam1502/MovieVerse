import '../models/movie-videos-id.dart';
import 'dart:convert';
import 'package:netflix/widgets/costants.dart';
import 'package:http/http.dart' as http;

class MovieVideosID_API {
  final int? id;
  MovieVideosID_API({required this.id});

  getMovieDetails_Data_URL() {
    final String movie_details_URL =
        "https://api.themoviedb.org/3/movie/$id/videos?language=en-US&api_key=${Constants.apiKey}";
    return movie_details_URL;
  }

  Future<List<MovieVideoById>> getMovieVideoByID() async {
    final response = await http.get(Uri.parse(getMovieDetails_Data_URL()));
    if (response.statusCode ==
        200) // if everything is fine then we want to decode our json
    {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData
          .map((movie) => MovieVideoById.fromJson(movie))
          .toList();
    } else {
      throw Exception(("Something Happend !"));
    }
  }
}
