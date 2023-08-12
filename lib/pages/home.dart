import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/home_widgets/drawer.dart';
import '../widgets/home_widgets/silder.dart';
import '../widgets/home_widgets/movie_list.dart';
import '../widgets/home_widgets/actor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Home Page'),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        )),
        drawer: DrawerWidgt(),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselDemo(),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(15),
              height: 30,
              child: Text('Recommended For You',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 250,
              child: movieSlide(),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(15),
              height: 30,
              child: Text('Trending',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 250,
              child: movieSlide(),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Trending Actors of this Week',
                style: TextStyle(
                    color: Color.fromARGB(255, 109, 109, 109),
                    fontFamily: 'Lato'),
              ),
            ),
            Container(
              width: 130,
              height: 190,
              child: actorList(),
            ),
          ],
        ));
  }
}
