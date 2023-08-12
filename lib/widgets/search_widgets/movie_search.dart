import 'package:flutter/material.dart';

class MovieSearch extends StatelessWidget {
  const MovieSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.all(10),
            width: 115,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              "https://cdn.images.express.co.uk/img/dynamic/36/590x/secondary/IT-movie-poster-960275.jpg", // Replace with your image URL
              width: 115,
              height: 160,
              fit: BoxFit.cover, // Adjust the image fit to your requirement
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 35, 0, 0)),
            Text('It'),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('1h 30 min')
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Horror'),
                SizedBox(
                  width: 8,
                ),
                Text('Thriller'),
                SizedBox(
                  width: 8,
                ),
                Text('Comedy')
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                  size: 10,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                  size: 15,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                  size: 15,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                  size: 15,
                ),
                Icon(
                  Icons.star,
                  color: Colors.grey[600],
                  size: 15,
                )
              ],
            ),
          ],
        ),
        Icon(Icons.bookmark_border),
      ],
    );
  }
}
