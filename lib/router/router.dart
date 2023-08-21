import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_nav.dart';
import '../pages/details.dart';

class myrouter {
  final GoRouter my_router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return BottomNav();
        },
      ),
      GoRoute(
        path: '/test',
        builder: (BuildContext context, GoRouterState state) {
          return MovieDetails();
        },
      ),
    ],
  );
}
