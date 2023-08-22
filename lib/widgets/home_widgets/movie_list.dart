import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';

class movieSlide extends StatelessWidget {
  String? backdrop_path;
  String? original_language;
  String original_title;
  String overview;
  String poster_path;
  String release_date;
  dynamic vote_average;
  int id;

  movieSlide(
      {required this.backdrop_path,
      required this.original_title,
      required this.original_language,
      required this.overview,
      required this.poster_path,
      required this.release_date,
      required this.vote_average,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final encodedBackdropPath = Uri.encodeComponent(backdrop_path!);
          final encodedOriginalLanguage =
              Uri.encodeComponent(original_language!);
          final encodedOriginalTitle = Uri.encodeComponent(original_title);
          final encodedOverview = Uri.encodeComponent(overview);
          final encodedPosterPath = Uri.encodeComponent(poster_path);
          final encodedReleaseDate = Uri.encodeComponent(release_date);
          final encodedVoteAverage =
              Uri.encodeComponent(vote_average.toString());
          final path =
              "/build/$encodedBackdropPath/$encodedOriginalLanguage/$encodedOriginalTitle/$encodedOverview/$encodedPosterPath/$encodedReleaseDate/$encodedVoteAverage/$id";
          GoRouter.of(context).go(path); // Navigate to '/second' route
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              width: 150,
              child: Image.network(
                this.poster_path,
                fit: BoxFit.cover,
                height: 900,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              padding: EdgeInsets.all(10),
              width: 150,
              height: 100,
              color: Colors.black87,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${this.original_title}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${this.vote_average}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
