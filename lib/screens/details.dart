import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/icon.dart';
import '../screens/video.dart';
import '../widgets/costants.dart';

class MovieDetails extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 10000,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage(Constants.imagePath + '${this.poster_path}'),
                  fit: BoxFit
                      .cover, // Set the fit option to cover to fill the container while maintaining the image's aspect ratio
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
                          Text('208.759',
                              style: TextStyle(color: Colors.white)),
                          Text(
                            '${this.original_title}',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s ',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white)),
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
        ),
        SizedBox(height: 30),
        FractionallySizedBox(
          widthFactor: 0.75,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Play',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 40),
        Container(
          padding: EdgeInsets.fromLTRB(35, 0, 25, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${this.original_title}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text('${this.overview}'),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                child: Expanded(
                    child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors.red,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://wallpapercave.com/wp/wp3701346.jpg'),
                              fit: BoxFit
                                  .cover, // Set the fit option to cover to fill the circular container while maintaining aspect ratio
                            ),
                          ),
                        )),
                  ],
                )),
              )
            ],
          ),
        ),
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
