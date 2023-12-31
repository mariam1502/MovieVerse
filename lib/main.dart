import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './router/router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import './widgets/youtube-video-preview-widget.dart';

final ThemeData myTheme = ThemeData(
  primaryColor: Colors.red, // Replace with your primary color
  scaffoldBackgroundColor: Colors.red, // Set the background color of the app
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
  //A widget that stores the state of providers. All Flutter applications using Riverpod
  // must contain a ProviderScope at the root of their widget tree.
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

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
    return MaterialApp.router(
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
      routerConfig: myrouter().my_router,
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
