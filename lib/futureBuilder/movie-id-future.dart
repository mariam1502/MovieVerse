import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix/providers/providers.dart';

import '../models/movie-details-id.dart';
import '../api/movie-details-api.dart';

import 'package:flutter/material.dart';
import '../widgets/costants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/details.dart';

class MovieDetailesFutureID extends ConsumerStatefulWidget {
  const MovieDetailesFutureID({super.key});

  @override
  ConsumerState<MovieDetailesFutureID> createState() =>
      _MovieDetailesFutureIDState();
}

class _MovieDetailesFutureIDState extends ConsumerState<MovieDetailesFutureID> {
  late Future<MovieId> popularData;
  @override
  void initState() {
    super.initState();
    popularData = MovieDetailsId_API(
            id: ref.read(SelectedMovieByIDProvider.notifier).state)
        .getMoviesDetailsData();
  }

  FutureBuilder MovieDetailsDataById() {
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

          return MovieDetails(
              backdropPath: snapshot.data!.backdropPath,
              genres: snapshot.data!.genres,
              id: snapshot.data!.id,
              imdbId: snapshot.data!.imdbId,
              originalLanguage: snapshot.data!.originalLanguage,
              originalTitle: snapshot.data!.originalTitle,
              overview: snapshot.data!.overview,
              posterPath: snapshot.data!.posterPath,
              releaseDate: snapshot.data!.releaseDate,
              runtime: snapshot.data!.runtime,
              status: snapshot.data!.status,
              title: snapshot.data!.title,
              voteAverage: snapshot.data!.voteAverage,
              voteCount: snapshot.data!.voteCount);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MovieDetailsDataById();
  }
}
