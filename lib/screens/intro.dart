import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/new_logo.png',
                      width: 160,
                    ),
                    SizedBox(
                        child: Column(
                      children: [
                        Text(
                          'Watch TV shows & movies.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'AnyWhere . Anytime',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .go('/home'); // Navigate to '/second' route
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Red background color
                    onPrimary: Colors.white, // White text color

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Adjust border radius as needed
                    ),
                  ),
                  child: Icon(
                    Icons.double_arrow_sharp,
                    color: Colors.white70,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
