import '../api/popular_movie_api.dart';
import '../models/popular_movies.dart';

import 'package:flutter/material.dart';
import '../widgets/costants.dart';
import '../widgets/home_widgets/movie_list.dart';

class PopularFuture extends StatefulWidget {
  const PopularFuture({super.key});

  @override
  State<PopularFuture> createState() => _PopularFutureState();
}

class _PopularFutureState extends State<PopularFuture> {
  late Future<List<PopularMovie>> popularData;
  @override
  void initState() {
    super.initState();
    popularData = PopularMovieAPI().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return popularMoviesList();
  }

  FutureBuilder popularMoviesList() {
    return FutureBuilder(
      future: popularData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
              "Error fetching data: ${snapshot.error}"); // Handle error if fetching data fails
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        } else if (!snapshot.hasData) {
          return Text('Data is empty !');
        }

        return Expanded(
            child: ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return movieSlide(
                    vote_average: snapshot.data![index].vote_average,
                    original_title:
                        snapshot.data![index].original_title.toString(),
                    poster_path: Constants.imagePath +
                        snapshot.data![index].poster_path.toString(),
                    backdrop_path: snapshot.data![index].backdrop_path,
                    id: snapshot.data![index].id,
                    overview: snapshot.data![index].overview,
                    release_date: snapshot.data![index].release_date,
                    original_language:
                        snapshot.data![index].original_language.toString(),
                  );
                }));
      },
    );
  }
}
