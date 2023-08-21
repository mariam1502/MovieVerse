import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/up_coming_movies.dart';

import '../widgets/costants.dart';

class upComingAPI {
  static const up_coming_url =
      "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&api_key=${Constants.apiKey}";

  Future<List<UpComing>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(up_coming_url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => UpComing.fromJson(movie)).toList();
    } else {
      throw Exception("Something Happened !");
    }
  }
}



//steps if fetching an API
// 1) create the URL link of the API
// 2) create a future list of objects that will wait for the response to finish 
// 3) after waiting we'll check if the response is okay or error 
// 4)if okay return the decoded parsed data in the form of object lists 
// then map it with fromjson method
// if error throw an exceptions