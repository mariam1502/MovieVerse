import 'package:flutter/material.dart';
import '../widgets/costants.dart';

class MovieActors extends StatefulWidget {
  String? name;
  String? profilePath;

  MovieActors({super.key, required this.name, required this.profilePath});

  @override
  State<MovieActors> createState() => _MovieActorsState();
}

class _MovieActorsState extends State<MovieActors> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(Constants.imagePath + '${widget.profilePath}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
