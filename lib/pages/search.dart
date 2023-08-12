import 'package:flutter/material.dart';
import 'package:netflix/widgets/home_widgets/movie_list.dart';
import '../widgets/search_widgets/movie_search.dart';
import '../widgets/search_widgets/search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Search')),
        body: Container(
          padding: EdgeInsets.all(25),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(
                height: 25,
              ),
              MovieSearch(),
            ],
          ),
        ));
  }
}
