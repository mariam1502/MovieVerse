import 'dart:convert';

import 'package:netflix/models/popular_movies.dart';
import 'package:netflix/widgets/costants.dart';
import 'package:http/http.dart' as http;

class PopularMovieAPI {
  static const _popularURL =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}";

// An asynchronous function can contain await expressions,
// which pause the function's execution until the awaited operation
//completes. However, the awaited operation is often a Future

  Future<List<PopularMovie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_popularURL));
    if (response.statusCode ==
        200) // if everything is fine then we want to decode our json
    {
      final decodedData = json.decode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData.map((movie) => PopularMovie.fromJson(movie)).toList();
    } else {
      throw Exception(("Something Happend !"));
    }
  }
}


//. A URI is a string of characters that identifies a name or a resource on the Internet. 
//Parsing refers to the process of analyzing a string of characters to understand its structure and extract relevant information.

//static is used when you want to create something that is shared
//among all instances of a class. It's a way to have properties or
//methods that don't depend on individual instances of the class.




//helpful code examples
// import 'package:http/http.dart' as http;

// Future<void> fetchData() async {
//   final response = await http.get(Uri.parse('https://api.example.com/data'));

//   if (response.statusCode == 200) {
//     // Request was successful, process the response
//     print('Response body: ${response.body}');
//   } else {
//     // Request failed, handle the error
//     print('Request failed with status: ${response.statusCode}');
//   }
// }

// void main() {
//   fetchData();
// }
