import 'package:flutter/material.dart';
import 'package:netflix/api/up_coming_movie_api.dart';
import 'package:netflix/models/up_coming_movies.dart';

import '../widgets/costants.dart';
import '../widgets/home_widgets/movie_list.dart';

class upComingFuture extends StatefulWidget {
  const upComingFuture({super.key});

  @override
  State<upComingFuture> createState() => _upComingFutureState();
}

class _upComingFutureState extends State<upComingFuture> {
  late Future<List<UpComing>> upComingData;
  @override
  void initState() {
    super.initState();
    upComingData = upComingAPI().getUpComingMovies();
  }

  FutureBuilder upComingMoviesList() {
    return FutureBuilder(
      future: upComingData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong !");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        } else if (!snapshot.hasData) {
          return Text("Data Empty !");
        }

        return Expanded(
            child: ListView.builder(
          itemCount: snapshot.data!.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return movieSlide(
                movieRatting: snapshot.data![index].vote_average,
                movieTite: snapshot.data![index].original_title.toString(),
                moviePoster: Constants.imagePath +
                    snapshot.data![index].posterPath.toString());
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return upComingMoviesList();
  }
}
