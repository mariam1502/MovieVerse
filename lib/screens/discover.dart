import 'package:flutter/material.dart';
import '../widgets/genre.dart';
import '../futureBuilder/movie-genre-future.dart';

class MovieDiscover extends StatelessWidget {
  MovieDiscover({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Discover"),
        ),
        body: Container(
            child: ListView(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            MovieGenreFuture()
            // AddGenre(
            //     imagePath: 'images/Action.jpg', movieGenre: 'Science Fiction')
          ],
        )));
  }
}
