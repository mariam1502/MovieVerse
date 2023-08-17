import 'package:flutter/material.dart';
import './pages/details.dart';
import './pages/discover.dart';
import './pages/video.dart';
import './pages/home.dart';
import './pages/search.dart';
import 'widgets/bottom_nav.dart';
import './models/popular_movies.dart';
import './api/popular_movie_api.dart';

final ThemeData myTheme = ThemeData(
  primaryColor: Colors.red, // Replace with your primary color
  scaffoldBackgroundColor: Colors.red, // Set the background color of the app
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  late Future<List<PopularMovie>> popularMovies;
  @override
  void initState() {
    super.initState();
    popularMovies = PopularMovieAPI().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    Color myPrimaryColor = Colors.black;

    // Create a MaterialColor from the custom primary color
    MaterialColor primarySwatch = MaterialColor(
      myPrimaryColor.value,
      <int, Color>{
        50: myPrimaryColor,
        100: myPrimaryColor,
        200: myPrimaryColor,
        300: myPrimaryColor,
        400: myPrimaryColor,
        500: myPrimaryColor,
        600: myPrimaryColor,
        700: myPrimaryColor,
        800: myPrimaryColor,
        900: myPrimaryColor,
      },
    );
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: primarySwatch,
          scaffoldBackgroundColor: primarySwatch[900],
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.redAccent, // Custom text color for AppBar title
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodyText2: TextStyle(
              // Define default text style for the bodyText2
              fontSize: 16,
              color: Colors.white70, // Custom text color for bodyText2
            ),
          ),
          iconTheme: IconThemeData(
            color:
                Colors.white70, // Set the default color for icons in this theme
            size: 23, // Set the default size for icons in this theme
          )),
      home: BottomNav(),
      // Set your initial screen here
    );
  }
}

//  HomePage()

// MovieDiscover()

// VideoPlayerView(
//   url:
//   'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
//   dataSourceType: DataSourceType.network))

// DetailsScreen()
