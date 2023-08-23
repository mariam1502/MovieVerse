import 'package:flutter/material.dart';

class MovieActors extends StatefulWidget {
  const MovieActors({super.key});

  @override
  State<MovieActors> createState() => _MovieActorsState();
}

class _MovieActorsState extends State<MovieActors> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
