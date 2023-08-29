import 'package:flutter/material.dart';

import '../costants.dart';

class ActorList extends StatelessWidget {
  final String name;
  final String profilePath;

  ActorList({
    required this.name,
    required this.profilePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(Constants.imagePath + '$profilePath'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 60,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
