import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix/providers/providers.dart';

import '../models/movie-videos-id.dart';
import '../api/movie-videos-id-api.dart';

import 'package:flutter/material.dart';
import '../widgets/youtube-video-preview-widget.dart';

class MovieVideoFutureID extends ConsumerStatefulWidget {
  const MovieVideoFutureID({super.key});

  @override
  ConsumerState<MovieVideoFutureID> createState() => _MovieVideoFutureIDState();
}

class _MovieVideoFutureIDState extends ConsumerState<MovieVideoFutureID> {
  late Future<MovieVideoById> trailerVideo;

  @override
  void initState() {
    super.initState();
    final movieVideoIDData = MovieVideosID_API(
      id: ref.read(SelectedMovieByIDProvider.notifier).state,
    );

    trailerVideo = movieVideoIDData.getMovieVideoByID().then((videos) =>
        videos.firstWhere((video) =>
            video.type == 'Trailer' &&
            video.site == 'YouTube' &&
            video.official == true));
  }

  FutureBuilder MovieDetailsDataById() {
    return FutureBuilder(
        future: trailerVideo,
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
            return Text('No trailer video available !');
          }

          return YouTubePlayerWidget(
              videoUrl:
                  'https://www.youtube.com/watch?v=${snapshot.data!.key}');
        });
  }

  @override
  Widget build(BuildContext context) {
    return MovieDetailsDataById();
  }
}
