import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/screens/discover.dart';
import 'package:netflix/screens/home.dart';
import '../widgets/bottom_nav.dart';
import '../screens/details.dart';
import '../futureBuilder/movie-id-future.dart';
import '../screens/intro.dart';

class myrouter {
  final GoRouter my_router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return IntroScreen();
        },
      ),

      //       String? backdrop_path;
      // String? original_language;
      // String original_title;
      // String overview;
      // String poster_path;
      // String release_date;
      // dynamic vote_average;
      // int id;

      // GoRoute(
      //   path:
      //       '/build/:backdrop_path/:original_language/:original_title/:overview/:poster_path/:release_date/:vote_average/:id',
      //   builder: (BuildContext context, GoRouterState state) {
      //     final backdrop_path = state.pathParameters['backdrop_path']!;
      //     final original_language = state.pathParameters['original_language']!;
      //     final original_title = state.pathParameters['original_title']!;
      //     final overview = state.pathParameters['overview']!;
      //     final poster_path = state.pathParameters['poster_path']!;
      //     final release_date = state.pathParameters['release_date']!;
      //     final vote_average = state.pathParameters['vote_average']!;
      //     final id = state.pathParameters['id']!;

      //     return MovieDetails(
      //         backdrop_path: backdrop_path,
      //         original_title: original_title,
      //         original_language: original_language,
      //         overview: overview,
      //         poster_path: poster_path,
      //         release_date: release_date,
      //         vote_average: vote_average,
      //         id: id);
      //   },
      // ),

      GoRoute(
        path: '/details',
        builder: (BuildContext context, GoRouterState state) {
          return MovieDetailesFutureID();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return BottomNav();
        },
      ),
    ],
  );
}
