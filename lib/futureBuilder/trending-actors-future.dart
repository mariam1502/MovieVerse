import '../api/trending-actors-api.dart';
import '../models/trending-actors.dart';
import 'package:flutter/material.dart';
import '../widgets/home_widgets/actor.dart';

class TrendingActorsFuture extends StatefulWidget {
  const TrendingActorsFuture({super.key});

  @override
  State<TrendingActorsFuture> createState() => _TrendingActorsFutureState();
}

class _TrendingActorsFutureState extends State<TrendingActorsFuture> {
  late Future<List<TrendingActors>> trendingactorsData;

  @override
  void initState() {
    super.initState();
    trendingactorsData = TrendingActorsAPI().getTrendingActors();
  }

  FutureBuilder TrendingActorsData() {
    return FutureBuilder(
      future: trendingactorsData,
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
                  ActorList(
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
    return TrendingActorsData();
  }
}
