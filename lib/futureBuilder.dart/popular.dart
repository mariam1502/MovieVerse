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
          return CircularProgressIndicator(
            color: Colors.white,
          );
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
                      movieRatting: snapshot.data![index].vote_average,
                      movieTite:
                          snapshot.data![index].original_title.toString(),
                      moviePoster: Constants.imagePath +
                          snapshot.data![index].poster_path.toString());
                }));
      },
    );
  }
}




   //   final overviewList = snapshot.data!
        //       // .map((e) =>   Image.network(
        //       //       Constants.imagePath + e.poster_path.toString(),
        //       //       width: 100,
        //       //     ))
        //       // .toList();

        //       .map(
        //         (popular) => Container(
        //           height: 250,
        //           child: movieSlide(
        //               movieRatting: popular.vote_average,
        //               movieTite: popular.original_title.toString(),
        //               moviePoster:
        //                   Constants.imagePath + popular.poster_path.toString()),
        //         ),
        //       )
        //       .toList();

        //   return overviewList;
        // }

