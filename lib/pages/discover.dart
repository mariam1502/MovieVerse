import 'package:flutter/material.dart';
import '../widgets/genre.dart';

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
            AddGenre(imagePath: 'images/Action.jpg', movieGenre: 'Action'),
            AddGenre(imagePath: 'images/Action.jpg', movieGenre: 'Adventure'),
            AddGenre(imagePath: 'images/Action.jpg', movieGenre: 'Comedy'),
            AddGenre(
                imagePath: 'images/Action.jpg', movieGenre: 'Crime&Gangster'),
            AddGenre(imagePath: 'images/Action.jpg', movieGenre: 'Drama'),
            AddGenre(
                imagePath: 'images/Action.jpg', movieGenre: 'Epic/Historical'),
            AddGenre(imagePath: 'images/Action.jpg', movieGenre: 'Musical'),
            AddGenre(
                imagePath: 'images/Action.jpg', movieGenre: 'Science Fiction')
          ],
        )));
  }
}
