import 'dart:ui';
import '../widgets/movie-cover-widget.dart';

import 'package:flutter/material.dart';
import '../screens/video.dart';
import '../widgets/play-button-widget.dart';
import '../widgets/movie-actors-widget.dart';

class MovieDetails extends StatefulWidget {
  String backdropPath;
  List<dynamic> genres;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  DateTime releaseDate;
  int runtime;
  String status;
  String title;
  double voteAverage;
  int voteCount;

  MovieDetails({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.status,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(children: [
        MovieCover(
            backdropPath: widget.backdropPath,
            original_language: widget.originalLanguage,
            original_title: widget.originalTitle,
            poster_path: widget.posterPath,
            release_date: widget.releaseDate,
            vote_average: widget.voteAverage),
        SizedBox(height: 30),
        PlayButton(),
        SizedBox(height: 40),
        Container(
          padding: EdgeInsets.fromLTRB(35, 0, 25, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${this.widget.originalTitle}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text('${this.widget.overview}'),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        MovieActors(),
        SizedBox(
          height: 10,
        ),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            VideoPlayerView(
                url:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
                dataSourceType: DataSourceType.network)
          ]),
        )
      ]),
    ));
  }
}
