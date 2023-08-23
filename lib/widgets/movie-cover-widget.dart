import 'dart:ui';

import 'package:flutter/material.dart';

import 'costants.dart';

class MovieCover extends StatelessWidget {
  dynamic poster_path;
  dynamic vote_average;
  dynamic original_title;
  dynamic original_language;
  dynamic release_date;

  MovieCover(
      {super.key,
      required this.original_language,
      required this.original_title,
      required this.poster_path,
      required this.release_date,
      required this.vote_average});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 270,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(Constants.imagePath + '${this.poster_path}'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY:
                    3), // Adjust the sigma values for the desired blur strength
            child: Container(
              color: Colors.black
                  .withOpacity(0), // Adjust the opacity value as needed
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          child: Row(
            children: [
              Container(
                  width: 130,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        Constants.imagePath + '${this.poster_path}'),
                  ))),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  color: Color.fromARGB(154, 0, 0, 0),
                  width: 196,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${this.vote_average.toString()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '/10',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Text('208.759', style: TextStyle(color: Colors.white)),
                      Container(
                        height: 70,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            '${this.original_title}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text('${this.original_language}',
                          style: TextStyle(color: Colors.white)),
                      Text('${this.release_date}',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 30,
                        width: 196,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_border_rounded,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.share,
                              color: Colors.red,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
