import 'dart:ui';
import '../widgets/movie-cover-widget.dart';

import 'package:flutter/material.dart';
import '../screens/video.dart';
import '../widgets/play-button-widget.dart';
import '../widgets/movie-actors-widget.dart';

class MovieDetails extends StatefulWidget {
  dynamic? backdrop_path;
  dynamic? original_language;
  dynamic original_title;
  dynamic overview;
  dynamic poster_path;
  dynamic release_date;
  dynamic vote_average;
  dynamic id;

  MovieDetails(
      {required this.backdrop_path,
      required this.original_title,
      required this.original_language,
      required this.overview,
      required this.poster_path,
      required this.release_date,
      required this.vote_average,
      required this.id});

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
            original_language: widget.original_language,
            original_title: widget.original_title,
            poster_path: widget.poster_path,
            release_date: widget.release_date,
            vote_average: widget.vote_average),
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
                '${this.widget.original_title}',
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
