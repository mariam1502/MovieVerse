import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix/providers/providers.dart';

import '../models/movie-actors-id.dart';
import '../api/movie-actors-id-api.dart';
import 'package:flutter/material.dart';
import '../widgets/movie-actors-widget.dart';

class MovieActorsIdFuture extends ConsumerStatefulWidget {
  const MovieActorsIdFuture({super.key});

  @override
  ConsumerState<MovieActorsIdFuture> createState() =>
      _MovieActorsIdFutureState();
}

class _MovieActorsIdFutureState extends ConsumerState<MovieActorsIdFuture> {
  late Future<List<MovieActorsById>> actorsData;
  @override
  void initState() {
    super.initState();
    actorsData =
        MovieActorsApi(id: ref.read(SelectedMovieByIDProvider.notifier).state)
            .getMovieActors();
  }

  FutureBuilder ActorsListData() {
    return FutureBuilder(
      future: actorsData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
              "Error fetching data: ${snapshot.error}"); // Handle error if fetching data fails
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        } else if (!snapshot.hasData) {
          return Text('Data is empty !');
        }

        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  MovieActors(
                      name: snapshot.data![index].name,
                      profilePath: snapshot.data![index].profilePath),
                  SizedBox(
                    width: 10,
                  )
                ]),
              ));
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ActorsListData();
  }
}
