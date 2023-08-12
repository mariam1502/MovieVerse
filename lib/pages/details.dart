import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/icon.dart';
import '../pages/video.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key});
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
                  image: NetworkImage(
                      'https://statcdn.fandango.com/MPX/image/NBCU_Fandango/624/71/thumb_E04C94D9-CEB2-455F-8191-7C787943E0AC__330754.jpg'),
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
                            'https://cdn.hmv.com/r/w-1280/hmv/files/99/99bb9b45-e577-4073-bb60-3b46341f6747.jpg'),
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
                                '7.6',
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
                            'Joker',
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
                'Joker',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
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
