import 'dart:ui';

import 'package:flutter/material.dart';
import '../icon.dart';

class movieSlide extends StatelessWidget {
  String movieTite;
  dynamic movieRatting;
  String moviePoster;
  movieSlide(
      {super.key,
      required this.movieRatting,
      required this.movieTite,
      required this.moviePoster});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          width: 150,
          color: Colors.red,
          child: Image.network(
            this.moviePoster,
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
                '${this.movieTite}',
                style: TextStyle(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${this.movieRatting}',
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
    );
  }
}
