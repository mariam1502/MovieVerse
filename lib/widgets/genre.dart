import 'package:flutter/material.dart';

class AddGenre extends StatelessWidget {
  AddGenre({super.key, required this.movieGenre, required this.imagePath});

  final String movieGenre;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image(
                  image: AssetImage(imagePath),
                  width: 70,
                  height: 70,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(movieGenre)
              ],
            ),
          ),
          Icon(
            Icons.navigate_next,
            size: 30,
          )
        ],
      ),
      SizedBox(
        height: 20,
      )
    ]);
  }
}
