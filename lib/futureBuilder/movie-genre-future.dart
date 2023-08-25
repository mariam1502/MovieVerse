import '../api/movie-genre-api.dart';
import '../models/movie-genre.dart';
import '../screens/discover.dart';
import 'package:flutter/material.dart';
import '../widgets/genre.dart';

class MovieGenreFuture extends StatefulWidget {
  const MovieGenreFuture({super.key});

  @override
  State<MovieGenreFuture> createState() => _MovieGenreFutureState();
}

class _MovieGenreFutureState extends State<MovieGenreFuture> {
  late Future<List<MovieGenre>> genreData;
  @override
  void initState() {
    super.initState();
    genreData = MovieGenreApi().getGenreMovies();
  }

  FutureBuilder genreList() {
    return FutureBuilder(
      future: genreData,
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
                itemBuilder: (context, index) {
                  return AddGenre(
                    imagePath: "images/Action.jpg",
                    id: snapshot.data![index].id,
                    name: snapshot.data![index].name,
                  );
                }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return genreList();
  }
}
