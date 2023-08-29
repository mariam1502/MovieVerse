import '../models/trending-actors.dart';
import 'dart:convert';
import 'package:netflix/widgets/costants.dart';
import 'package:http/http.dart' as http;

class TrendingActorsAPI {
  static const trending_actors_url =
      "https://api.themoviedb.org/3/trending/person/week?language=en-US&api_key=${Constants.apiKey}";

  Future<List<TrendingActors>> getTrendingActors() async {
    final response = await http.get(Uri.parse(trending_actors_url));
    if (response.statusCode ==
        200) // if everything is fine then we want to decode our json
    {
      final decodedData = json.decode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData
          .map((movie) => TrendingActors.fromJson(movie))
          .toList();
    } else {
      throw Exception(("Something Happend !"));
    }
  }
}
