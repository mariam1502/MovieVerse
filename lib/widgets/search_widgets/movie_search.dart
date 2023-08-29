import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/providers.dart';
import '../../widgets/costants.dart';

class MovieSearch extends ConsumerStatefulWidget {
  String? posterPath;
  String? title;
  dynamic? voteAverage;
  dynamic? id;

  MovieSearch(
      {super.key, this.id, this.posterPath, this.title, this.voteAverage});

  @override
  ConsumerState<MovieSearch> createState() => _MovieSearchState();
}

class _MovieSearchState extends ConsumerState<MovieSearch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          ref.read(SelectedMovieByIDProvider.notifier).state = widget.id;

          GoRouter.of(context).go('/details'); // Navigate to '/second' route
        },
        child: Row(
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
                  Constants.imagePath +
                      "${this.widget.posterPath}", // Replace with your image URL
                  width: 115,
                  height: 160,
                  fit: BoxFit.cover, // Adjust the image fit to your requirement
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 35, 0, 0)),
                Text('${widget.title}'),
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
            SizedBox(
              height: 15,
            )
          ],
        ));
  }
}
