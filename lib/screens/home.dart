import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/home_widgets/drawer.dart';
import '../widgets/home_widgets/silder.dart';
import '../widgets/home_widgets/actor.dart';
import '../futureBuilder/popular.dart';
import '../futureBuilder/upcoming.dart';
import '../futureBuilder/trending-actors-future.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Future<List<PopularMovie>> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Home Page'),
            IconButton(
                onPressed: () {
                  GoRouter.of(context)
                      .go('/search'); // Navigate to '/second' route
                },
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
              child: Text('Popular Movies',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(height: 250, child: PopularFuture()),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(15),
              height: 30,
              child: Text('Up Coming Movies',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(height: 250, child: upComingFuture()),
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
              height: 130,
              child: TrendingActorsFuture(),
            ),
          ],
        ));
  }
}
